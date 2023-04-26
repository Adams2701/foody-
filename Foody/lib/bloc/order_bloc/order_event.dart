

import 'package:equatable/equatable.dart';

abstract class OrderEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class LoadOrderEvent extends OrderEvent {
  final String name;
  final String dishId;

  LoadOrderEvent({required this.name, required this.dishId});
}

class NameChangedEvent extends OrderEvent {
  final String name;

  NameChangedEvent({required this.name});
}