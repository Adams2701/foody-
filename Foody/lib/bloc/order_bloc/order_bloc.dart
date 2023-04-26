

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/order_bloc/order_event.dart';
import 'package:foody/bloc/order_bloc/order_state.dart';
import 'package:foody/networking/networkService.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final DishApi _dishApi;
  OrderBloc( this._dishApi) : super(OrderInitialState()) {
    on<LoadOrderEvent>((event, emit) async {
      emit(OrderLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await _dishApi.placeOrder(orderName: event.name, dishId:event.dishId);
        emit(OrderLoaded());
      } catch (e) {
        emit(OrderError(e.toString()));
      }
    });

    on<NameChangedEvent>((event, emit)  {
     if(event.name.isEmpty){
       emit(NameNotValidated());
     }else{
       emit(NameValidated());
     }
    });

  }
}