

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/special_bloc/special_event.dart';
import 'package:foody/bloc/special_bloc/special_states.dart';
import 'package:foody/networking/networkService.dart';

class SpecialBloc extends Bloc<SpecialEvent, SpecialState> {
  final DishApi _dishApi;
  SpecialBloc(this._dishApi) : super(SpecialLoadingState()){
    on<LoadSpecialEvent>((event, emit) async {
      emit(SpecialLoadingState());
      try {
        final specialData = await _dishApi.fetchDishCategories();
        emit(SpecialLoadedState(specialData.data?.specials??[]));
      } catch (err) {
        emit(ErrorSpecial(err.toString()));
      }

    });
  }
}
