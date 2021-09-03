import 'package:practise_dart/asyncronous/model/student.dart';

void main() {
  final students = <Student>[
    Student(id: 0, name: 'Nguyen Van A', age: 18, score: 9, friends: ['Nguyen Vu A', 'Van Thi A']),
    Student(id: 1, name: 'Ho Van B', age: 20, score: 3, friends: ['Nguyen Vu B', 'Van Thi B']),
    Student(id: 2, name: 'Tran Hoang C', age: 19, score: 5, friends: ['Nguyen Vu C', 'Van Thi C']),
    Student(id: 3, name: 'Hoang Van D', age: 21, score: 2, friends: ['Nguyen Vu D', 'Van Thi D']),
    Student(id: 4, name: 'Nguyen Van E', age: 12, score: 6, friends: ['Nguyen Vu E', 'Van Thi E']),
    Student(id: 5, name: 'Ho Van F', age: 34, score: 7, friends: ['Nguyen Vu F', 'Van Thi F']),
    Student(id: 6, name: 'Tran Hoang G', age: 17, score: 8, friends: ['Nguyen Vu G', 'Van Thi G']),
    Student(id: 7, name: 'Hoang Van H', age: 16, score: 10, friends: ['Nguyen Vu H', 'Van Thi H']),
    Student(id: 8, name: 'Vo Hoang I', age: 24, score: 6, friends: ['Nguyen Vu I', 'Van Thi I']),
    Student(id: 9, name: 'Truong Gia K', age: 21, score: 6, friends: ['Nguyen Vu K', 'Van Thi K']),
    Student(id: 10, name: 'Nguyen Van L', age: 13, score: 9, friends: ['Nguyen Vu L', 'Van Thi AL']),
    Student(id: 11, name: 'Ho Van M', age: 20, score: 3, friends: ['Nguyen Vu M', 'Van Thi M']),
    Student(id: 12, name: 'Tran Hoang N', age: 19, score: 5, friends: ['Nguyen Vu N', 'Van Thi N']),
    Student(id: 13, name: 'Hoang Van O', age: 21, score: 2, friends: ['Nguyen Vu O', 'Van Thi O']),
    Student(id: 14, name: 'Nguyen Van P', age: 12, score: 6, friends: ['Nguyen Vu P', 'Van Thi P']),
    Student(id: 15, name: 'Ho Van Q', age: 34, score: 4, friends: ['Nguyen Vu Q', 'Van Thi Q']),
    Student(id: 16, name: 'Tran Hoang X', age: 17, score: 1, friends: ['Nguyen Vu X', 'Van Thi X']),
    Student(id: 17, name: 'Hoang Van Y', age: 16, score: 10, friends: ['Nguyen Vu Y', 'Van Thi Y']),
    Student(id: 18, name: 'Vo Hoang Z', age: 24, score: 3, friends: ['Nguyen Vu Z', 'Van Thi Z']),
    Student(id: 19, name: 'Truong Gia V', age: 21, score: 6, friends: ['Nguyen Vu V', 'Van Thi V']),
  ];

  printNameStudent(listStudent: students, score: 5);
}

void printNameStudent({required List<Student> listStudent, required int score}) async {
  var students18 = await findStudentPassExam(listStudent: listStudent, score: score).then((listStudent) async {
    var list = listStudent.first.friends;
    if (list == null || list.isEmpty) {
      return list;
    }

    /// Note: Method có async nhưng ko có await thì chỉ là hàm sync ko phải async
    /// forEarch không có khả năng await method async
    /// Ref: https://stackoverflow.com/a/53887819/10262450
    // Cach 1: Dùng foreach và await context (wait Future.delay() in method isCheck18Age())
    listStudent.forEach((element) async {
      if (element.name == listStudent.first.name) {
        return;
      }
      if (await isCheck18Age(student: element)) {
        list.add(element.name!);
      }
    });

    // // Cach 1: use Future.wait đợi Future
    // var futureResponse = listStudent.map((element) async {
    //   if (element.name == listStudent.first.name) {
    //     return;
    //   }
    //   if (await isCheck18Age(student: element)) {
    //     list.add(element.name!);
    //   }
    // });
    // await Future.wait(futureResponse);

    //// Cach 2: use "for" replace "forEach"
    /// Ref: https://stackoverflow.com/questions/57889195/analog-of-promise-all-in-dart
    // for (var element in listStudent) {
    //   if (element.name == listStudent.first.name) {
    //     continue;
    //   }
    //   if (await isCheck18Age(student: element)) {
    //     list.add(element.name!);
    //   }
    // }
    return list;
  });

  print('Number of Student: ${students18!.length}');
  students18.forEach((element) {
    print('Friend $element');
  });
}

Future<List<Student>> findStudentPassExam({required List<Student> listStudent, required int score}) async {
  var list = <Student>[];
  listStudent.forEach((element) async {
    if (await isCheckStudent(student: element, score: score)) {
      list.add(element);
    }
  });
  return list;
}

Future<bool> isCheckStudent({required Student student, required int score}) async {
  if (student.score! >= score) {
    return true;
  }
  return false;
}

Future<bool> isCheck18Age({required Student student}) async {
  /// await to change method sync => async
  await Future.delayed(const Duration(milliseconds: 1));
  if (student.age! >= 18) {
    return true;
  }
  return false;
}
