void broadcastStream() {
  var data = Future<int>.delayed(Duration(seconds: 1), () {
    return 100;
  });

// Can listen multi Stream
  Stream<int> stream = Stream<int>.fromFuture(data).asBroadcastStream();

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });
}
