void useStreamWithIterable() {
  var data = Iterable<int>.generate(10, (value) {
    return value * 1000;
  });

  Stream<int> stream = Stream<int>.fromIterable(data);
  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });
}
