
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/popular_bloc/popular_event.dart';
import 'package:foody/bloc/popular_bloc/popular_states.dart';
import 'package:foody/networking/networkService.dart';


class PopularBloc extends Bloc<PopularEvent, PopularState> {
  final DishApi _dishApi;
  PopularBloc(this._dishApi) : super(PopularLoadingState()){
    on<LoadPopularEvent>((event, emit) async {
      emit(PopularLoadingState());
      try {
        final popularData = await _dishApi.fetchDishCategories();
        emit(PopularLoadedState(popularData.data?.populars ??[]));
      } catch (err) {
        emit(ErrorPopular(err.toString()));
      }

    });
  }
}