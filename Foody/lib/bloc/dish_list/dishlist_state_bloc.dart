

import 'package:equatable/equatable.dart';
import 'package:foody/data_layer/apiModels/dishes_response_model.dart';

import '../../data_layer/apiModels/dishModel.dart';

abstract class DishListState extends Equatable {}

//when the data is loading

class DishListLoadingState extends DishListState{
  @override
  List<Object?> get props => [];

}
// when the data has loaded

class DishListLoadedState extends DishListState{
  final List<Data2> dishList;
  DishListLoadedState(this.dishList);

  @override
  List<Object?> get props => [dishList];
}

//when there is error

class ErrorDishList extends DishListState {
  final String error;
  ErrorDishList(this.error);

  @override
  List<Object?> get props =>[error];

}