import 'model/student.dart';

void main() {
  // Fix: can't print list student pass
  final students = <Student>[
    Student(id: 0, name: 'Nguyen Van A', age: 18, score: 9),
    Student(id: 1, name: 'Ho Van B', age: 20, score: 3),
    Student(id: 2, name: 'Tran Hoang C', age: 19, score: 5),
    Student(id: 3, name: 'Hoang Van D', age: 21, score: 2),
    Student(id: 4, name: 'Nguyen Van E', age: 12, score: 6),
    Student(id: 5, name: 'Ho Van F', age: 34, score: 7),
    Student(id: 6, name: 'Tran Hoang G', age: 17, score: 8),
    Student(id: 7, name: 'Hoang Van H', age: 16, score: 10),
    Student(id: 8, name: 'Vo Hoang I', age: 24, score: 6),
    Student(id: 9, name: 'Truong Gia K', age: 21, score: 6),
  ];

  printStudentPass(students: students, score: 5);
}

void printStudentPass({required List<Student> students, required int score}) async {
  var listStudentPass = await findStudentPass(students: students, score: score);
  print('Number student pass: ${listStudentPass.length}');
  listStudentPass.forEach((element) {
    print('Student: ${element.id}: ${element.name}, score: ${element.score}');
  });
}

Future<List<Student>> findStudentPass({required List<Student> students, required int score}) async {
  var listStudent = <Student>[];
  students.forEach((element) async {
    if (await isCheckStudentPass(student: element, score: score)) {
      listStudent.add(element);
    }
  });

  return listStudent;
}

Future<bool> isCheckStudentPass({required Student student, required int score}) async {
  await Future.delayed(const Duration(milliseconds: 1));
  if (student.score! >= score) {
    return true;
  }
  return false;
}
