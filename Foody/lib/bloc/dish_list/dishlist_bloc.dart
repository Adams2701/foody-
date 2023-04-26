import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/dish_list/dishlist-event_bloc.dart';
import 'package:foody/bloc/dish_list/dishlist_state_bloc.dart';
import 'package:foody/networking/networkService.dart';

class DishListBloc extends Bloc<DishListEvent, DishListState> {
  final DishApi _dishApi;
  DishListBloc(this._dishApi) : super(DishListLoadingState()) {
    on<LoadDishListEvent>((event, emit) async {
      emit(DishListLoadingState());
      try {
       final dishList = await _dishApi.fetchDishesByCategory(event.categoryId);
        emit(DishListLoadedState(dishList));
      } catch (err) {
        emit(ErrorDishList(err.toString()));
      }
    });
  }
}

