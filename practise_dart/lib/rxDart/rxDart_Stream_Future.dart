/// Reference: http://reactivex.io/documentation/operators.html
void main(List<String> arguments) async {
  testOperator_Stream();
}

void testOperator_Stream() {
  Stream.fromFuture(getAge()).listen((data) {
    print(data);
  });
}

Future<int> getAge() async {
  return 200;
}

Future<String> getNameById(dynamic id) async {
  if (id is! int) {
    throw Exception('id must be in');
  }
  return 'Bill Nguyen';
}
