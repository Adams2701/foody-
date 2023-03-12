

import 'package:equatable/equatable.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';

abstract class CategoryState extends Equatable {}

//when the data is loading

class CategoryLoadingState extends CategoryState{
  @override
  List<Object?> get props => [];

}
 // when the data has loaded

class CategoryLoadedState extends CategoryState{
  final List<DishCategoriesResponse> category;
  CategoryLoadedState(this.category);

  @override
  List<Object?> get props => [category];
}

//when there is error

class ErrorCategory extends CategoryState {
final String error;
ErrorCategory(this.error);

  @override
  List<Object?> get props =>[error];

}