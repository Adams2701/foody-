
import 'package:equatable/equatable.dart';

abstract class SpecialEvent extends Equatable {
  const SpecialEvent();
}

class LoadSpecialEvent extends SpecialEvent{
  @override
  List<Object?> get props => [];

}