

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/networking/networkService.dart';
import 'package:equatable/equatable.dart';

// Events
abstract class DishEvent extends Equatable {}

class LoadDishData extends DishEvent {
  @override
  List<Object?> get props => [];
}

// States
abstract class DishState extends Equatable {}

class DishLoadingState extends DishState {
  @override
  List<Object?> get props => [];
}

class DishLoadedState<T> extends DishState {
  final Data data;

  DishLoadedState(this.data);

  @override
  List<Object?> get props => [data];
}

class DishErrorState extends DishState {
  final String error;

  DishErrorState(this.error);

  @override
  List<Object?> get props => [error];
}

class DishBloc extends Bloc<DishEvent, DishState> {
  final DishApi _dishApi;
  DishBloc(this._dishApi) : super(DishLoadingState()){
    on<LoadDishData>((event, emit) async {
      emit(DishLoadingState());
      try {
        var dishData = await _dishApi.fetchDishData();
        emit(DishLoadedState(dishData.data!));
      }catch (err) {
        emit(DishErrorState(err.toString()));
      }
    });
  }
}