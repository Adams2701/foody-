

import 'package:equatable/equatable.dart';

abstract class DishListEvent extends Equatable {
  const DishListEvent();
}

class LoadDishListEvent extends DishListEvent{
  final String categoryId;

  const LoadDishListEvent(this.categoryId);
  @override
  List<Object?> get props => [categoryId];

}
