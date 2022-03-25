import 'dart:async';

class CounterBloc {
  int counter = 0;

  final StreamController<int> _streamController = StreamController<int>();
  StreamController get streamController => _streamController;

  Sink<int> get counterSink => _streamController.sink;
  Stream<int> get counterStream => _streamController.stream;

  void incrementCounter() {
    counter++;
    counterSink.add(counter);
    print(counterStream);
  }
}
