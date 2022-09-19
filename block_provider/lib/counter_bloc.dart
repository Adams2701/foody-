

import 'dart:async';

enum CounterAction {
  increment,
  decrement,
  reset
}

class CounterBloc {
  late int counter;
  final _stateStreamController = StreamController<int>();   //.broadcast if u want to make it global such that it can be listened to in a multiple places
  StreamSink<int> get counterSink => _stateStreamController.sink;
  Stream<int> get counterStream => _stateStreamController.stream;

  final _eventStreamController = StreamController<CounterAction>();
  StreamSink<CounterAction> get eventSink => _eventStreamController.sink;
  Stream<CounterAction> get eventStream => _eventStreamController.stream;

counterBloc(){
  counter = 0;
  eventStream.listen((event) {
    if (event == CounterAction.increment) {
      counter ++;
    } else if (event == CounterAction.decrement) {
      counter --;
    } else if (event == CounterAction.reset) {
      counter = 0;
    }
    counterSink.add(counter);
  });
}

void dispose(){
_stateStreamController.close();
_eventStreamController.close();

}

}