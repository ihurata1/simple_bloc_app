import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_bloc_app/bloc/user/event.dart';
import 'package:simple_bloc_app/bloc/user/state.dart';
import 'package:simple_bloc_app/constant/list.dart';
import 'package:simple_bloc_app/model/user.dart';

class UserBloc extends Bloc<UserEvents, UserStates> {
  List<UserBlocModel> _list = AppLists.users;
  UserBloc() : super(InitialState()) {
    on<AddUserEvent>((event, emit) => onAddUser(event, emit));
    on<DeleteUserEvent>((event, emit) => onDeleteUser(event, emit));
  }

  void onAddUser(AddUserEvent event, Emitter<UserStates> emit) async {
    _list.add(event.user);
    emit(UpdateState(_list));
  }

  void onDeleteUser(DeleteUserEvent event, Emitter<UserStates> emit) async {
    _list.removeWhere((element) => element == event.user);
    emit(UpdateState(_list));
  }
}
