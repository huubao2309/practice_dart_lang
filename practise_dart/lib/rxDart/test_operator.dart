/// Reference: http://reactivex.io/documentation/operators.html
void main(List<String> arguments) async {
  testOperator_Skip();
}

void testOperator_Listen() {
  // Create list
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // print List
  Stream.fromIterable(list).listen((data) {
    print(data);
  });
}

// Get a few value
void testOperator_Take() {
  // Create list
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // print List with 6 value of List
  Stream.fromIterable(list).take(6).listen((data) {
    print(data);
  });
}

// Get value with condition
void testOperator_Where() {
  // Create list
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // print List with 6 value that value % 2 == 0
  Stream.fromIterable(list).take(6).where(
    (item) {
      return item % 2 == 0;
    },
  ).listen((data) {
    print(data);
  });
}

// Tranform item in list
void testOperator_Map() {
  // Create list
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // Print List with 6 value that value % 2 == 0 and change value * 100
  Stream.fromIterable(list).take(6).where(
    (item) {
      return item % 2 == 0;
    },
  ).map(
    (item) {
      return item * 100;
    },
  ).listen((data) {
    print(data);
  });
}

// Can call continue take after tranform
void testOperator_Map_And_Take() {
  // Create list
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // Print List with 6 value that value % 2 == 0 and change value * 100
  Stream.fromIterable(list)
      .take(6) // call 1
      .map(
        (item) {
          return item * 100;
        },
      )
      .take(3) // call 2
      .listen((data) {
        print(data);
      });
}

// Use Skip
void testOperator_Skip() {
  // Create list
  var list = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // Print List with 6 value that value % 2 == 0 and change value * 100
  Stream.fromIterable(list)
      .take(6)
      .map(
        (item) {
          return item * 100;
        },
      )
      .skip(3) // skip 3 frist value of list
      .listen((data) {
        print(data);
      });
}
