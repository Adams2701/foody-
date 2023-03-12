

import 'package:equatable/equatable.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';

abstract class SpecialState extends Equatable {}

//when the data is loading

class SpecialLoadingState extends SpecialState{
  @override
  List<Object?> get props => [];

}
// when the data has loaded

class SpecialLoadedState extends SpecialState{
  final List<Specials> special;
  SpecialLoadedState(this.special);

  @override
  List<Object?> get props => [special];
}

//when there is error

class ErrorSpecial extends SpecialState {
  final String error;
  ErrorSpecial(this.error);

  @override
  List<Object?> get props =>[error];

}