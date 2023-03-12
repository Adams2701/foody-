

import 'package:equatable/equatable.dart';

abstract class PopularEvent extends Equatable {
  const PopularEvent();
}

class LoadPopularEvent extends PopularEvent{
  @override
  List<Object?> get props => [];

}