void streamWithPeriodic() {
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  stream.listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });
}
