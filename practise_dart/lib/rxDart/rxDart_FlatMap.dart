import 'package:rxdart/rxdart.dart';

/// Reference: http://reactivex.io/documentation/operators.html
void main(List<String> arguments) {
  demo_FlatMap();
}

// FlatMap use for Tranform Obserable
Future<void> demo_FlatMap() async {
  var subject = PublishSubject<int>();

  subject.map((item) => getNameById(item)).listen(print);

  subject.add(getUserById());
}

int getUserById() {
  return 200;
}

String getNameById(id) {
  if (id is! int) {
    throw Exception('id must be in');
  }
  return 'Bill Nguyen';
}
