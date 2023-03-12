

import 'package:equatable/equatable.dart';

import '../../data_layer/apiModels/dishModel.dart';

abstract class PopularState extends Equatable {}

//when the data is loading

class PopularLoadingState extends PopularState{
  @override
  List<Object?> get props => [];

}
// when the data has loaded

class PopularLoadedState extends PopularState{
  final List<Populars> popular;
  PopularLoadedState(this.popular);

  @override
  List<Object?> get props => [popular];
}

//when there is error

class ErrorPopular extends PopularState {
  final String error;
  ErrorPopular(this.error);

  @override
  List<Object?> get props =>[error];

}