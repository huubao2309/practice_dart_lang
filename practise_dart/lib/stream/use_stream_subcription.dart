void streamSubcription() {
  Stream<int> stream = Stream<int>.periodic(Duration(seconds: 1), (value) {
    return value;
  });

  var subcription = stream.take(10).listen((data) {
    print(data.toString());
  }, onDone: () {
    print("done");
  });

  // After 3s, Pause Stream
  Future.delayed(Duration(seconds: 3), () {
    //subcription.pause();
    subcription.pause(Future.delayed(Duration(microseconds: 100), () {
      print('pause');
    }));
  });

  // Next 3s, Resume stream
  Future.delayed(Duration(seconds: 6), () {
    subcription.resume();
  });
}
