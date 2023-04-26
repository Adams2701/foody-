
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class OrderState extends Equatable {}

class OrderInitialState extends OrderState{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class OrderLoading extends OrderState {
  @override
  List<Object?> get props => [];
}

class OrderLoaded extends OrderState{
  @override
  List<Object?> get props =>[];

}

class OrderError extends OrderState {
  final String error;

  OrderError(this.error);
  @override
  List<Object?> get props => [error];
}

class NameValidated extends OrderState {
  @override
  List<Object?> get props => [];
}

class NameNotValidated extends OrderState{
  @override
  List<Object?> get props =>[];

}