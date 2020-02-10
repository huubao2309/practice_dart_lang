import 'dart:async';

void streamWithFuture() {
  var data = Future<int>.delayed(Duration(seconds: 1), () {
    return 100;
  });

  Stream<int> stream = Stream<int>.fromFuture(data);

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });
}
