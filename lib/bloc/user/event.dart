import 'package:simple_bloc_app/model/user.dart';

class UserEvents {}

class AddUserEvent extends UserEvents {
  final UserBlocModel user;
  AddUserEvent(this.user);
}

class DeleteUserEvent extends UserEvents {
  final UserBlocModel user;
  DeleteUserEvent(this.user);
}
