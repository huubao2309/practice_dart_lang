import 'dart:async';

void streamController() {
  // Stream Controller
  StreamController<int> controller = StreamController<int>();

// listen
  controller.stream.listen((data) {
    print(data);
  });

  // add value
  controller.sink.add(100);
  controller.sink.add(200);
}
