import 'dart:async';

void streamTranformer() {
  // Stream Tranformer
  Stream<int> stream = Stream.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  stream
      .transform(StreamTransformer.fromHandlers(handleData: (input, sink) {
        var newValue = input * 1000;
        sink.add(newValue);
      }))
      .take(10)
      .listen((data) {
        print(data);
      });
}
