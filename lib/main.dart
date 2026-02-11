import 'dart:async';

// ========== PART 1: FUNCTIONS ==========

// Q1: Function to print welcome message
void welcomeMessage() {
  print("Welcome to the School Management System!");
}

// Q2: Function with named parameters
void createStudent({required String name, required int age}) {
  print("Student Details:");
  print("Name: $name");
  print("Age: $age");
}

// Q3: Function with required and optional parameters
void createTeacher(String name, [String? subject]) {
  print("Teacher Details:");
  print("Name: $name");
  print("Subject: ${subject ?? 'Subject not assigned'}");
}

// ========== PART 2: CONSTRUCTORS AND CLASSES ==========

// Q4: Student class with constructor
class Student {
  String name;
  int age;
  
  Student(this.name, this.age);
}

// Q5: Create Student object
// Done in main function

// ========== PART 3: INHERITANCE ==========

// Q6: Person class
class Person {
  String name;
  
  Person(this.name);
  
  void introduce() {
    print("Hello, my name is $name");
  }
}

// Q7: Student inherits from Person
class Student2 extends Person {
  int age;
  
  Student2(String name, this.age) : super(name);
}

// ========== PART 4: INTERFACES ==========

// Q8: Abstract class as interface
abstract class Registrable {
  void registerCourse(String courseName);
}

// Q9: Student implements Registrable
class Student3 extends Person implements Registrable {
  int age;
  
  Student3(String name, this.age) : super(name);
  
  @override
  void registerCourse(String courseName) {
    print("$name is registered for $courseName");
  }
}

// ========== PART 5: MIXINS ==========

// Q10: Attendance mixin
mixin AttendanceMixin {
  int attendanceCount = 0;
  
  void markAttendance() {
    attendanceCount++;
    print("Attendance marked. Total: $attendanceCount");
  }
}

// Q11: Student with AttendanceMixin
class Student4 extends Person with AttendanceMixin {
  int age;
  
  Student4(String name, this.age) : super(name);
}

// ========== PART 6: COLLECTIONS > DONE IN MAIN FUNCTION ==========
// Q12: List of Students (SEE ON LINE 178)
// Q13: Map of Students (SEE ON LINE 187)
// Q14: Anonymous function to print student names (SEE ON LINE 199)

// ========== PART 7: ANONYMOUS AND ARROW FUNCTIONS ==========

// Arrow function for Q15
void greetStudent(String name) => print("Welcome, $name!");

// ========== PART 8: ASYNCHRONOUS PROGRAMMING ==========

// Q16: Async function
Future<List<Student>> loadStudents() async {
  await Future.delayed(Duration(seconds: 2));
  return [
    Student("Aimable", 20),
    Student("Nelson", 21),
    Student("Beatrice", 22),
  ];
}

// ========== PART 9: INTEGRATION CHALLENGE ==========

// Q19: Notification mixin
mixin NotificationMixin {
  void notifyRegistration(String studentName, String courseName) {
    print("Notification: $studentName has been registered for $courseName");
  }
}

// Final Student class with all features
class FinalStudent extends Person with AttendanceMixin, NotificationMixin implements Registrable {
  int age;
  final String studentId;
  
  FinalStudent(String name, this.age, this.studentId) : super(name);
  
  @override
  void registerCourse(String courseName) {
    print("$name is registered for $courseName");
    notifyRegistration(name, courseName);
  }
}

// ========== MAIN FUNCTION ==========
void main() async {
  print("=== Q1: Welcome Message ===");
  welcomeMessage();
  print("");
  
  print("=== Q2: Create Student with Named Parameters ===");
  createStudent(name: "Kalisa John", age: 20);
  print("");
  
  print("=== Q3: Create Teacher with Optional Parameter ===");
  createTeacher("Professor Diedone");
  createTeacher("Dr. Hitimana", "Web Development");
  print("");
  
  print("=== Q4 & Q5: Student Class and Object ===");
  Student student1 = Student("Aimable", 20);
  print("Student: ${student1.name}, Age: ${student1.age}");
  print("");
  
  print("=== Q6 & Q7: Inheritance ===");
  Student2 student2 = Student2("Nelson", 21);
  student2.introduce();
  print("");
  
  print("=== Q8 & Q9: Interfaces ===");
  Student3 student3 = Student3("Beatrice", 22);
  student3.registerCourse("Dart Programming");
  print("");
  
  print("=== Q10 & Q11: Mixins ===");
  Student4 student4 = Student4("David", 23);
  student4.markAttendance();
  student4.markAttendance();
  student4.markAttendance();
  print("Total attendance for ${student4.name}: ${student4.attendanceCount}");
  print("");
  
  print("=== Q12: List of Students ===");
  List<Student> students = [
    Student("Ange", 20),
    Student("Abel", 21),
    Student("Boris", 22),
  ];
  print("Total students in list: ${students.length}");
  print("");
  
  print("=== Q13: Map of Students ===");
  Map<String, Student> studentMap = {
    "S001": Student("Sibo", 20),
    "S002": Student("Justine", 21),
    "S003": Student("Fils", 22),
  };
  print("Students in map:");
  studentMap.forEach((id, student) {
    print("ID: $id, Name: ${student.name}");
  });
  print("");
  
  print("=== Q14: Anonymous Function ===");
  print("Student names from list:");
  students.forEach((student) {
    print("- ${student.name}");
  });
  print("");
  
  print("=== Q15: Arrow Function ===");
  greetStudent("Blandon");
  print("");
  
  print("=== Q16 & Q17: Async Programming ===");
  print("Loading students...");
  List<Student> loadedStudents = await loadStudents();
  print("Loaded ${loadedStudents.length} students");
  print("");
  
  print("=== Q19: Notification Mixin ===");
  FinalStudent finalStudent = FinalStudent("Janvier", 24, "S004");
  finalStudent.registerCourse("Advanced Dart");
  print("");
  
  print("=== Lab Complete ===");
}