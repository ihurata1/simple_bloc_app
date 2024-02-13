import 'package:simple_bloc_app/model/user.dart';

class UserStates {}

class InitialState extends UserStates {}

class UpdateState extends UserStates {
  final List<UserBlocModel> list;
  UpdateState(this.list);
}
