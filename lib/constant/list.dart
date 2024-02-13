import 'package:simple_bloc_app/model/user.dart';

class AppLists {
  static List<UserBlocModel> users = [
    UserBlocModel(name: "Joe", age: "26", job: "Software Engineer"),
    UserBlocModel(name: "Anna", age: "22", job: "Architect"),
    UserBlocModel(name: "Tom", age: "15", job: "Student"),
  ];
}
