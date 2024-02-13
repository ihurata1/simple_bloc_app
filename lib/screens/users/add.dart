// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unnecessary_new, unused_field, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:simple_bloc_app/bloc/user/bloc.dart';
import 'package:simple_bloc_app/bloc/user/event.dart';
import 'package:simple_bloc_app/bloc/user/state.dart';
import 'package:simple_bloc_app/model/user.dart';

class AddUserScreen extends StatelessWidget {
  AddUserScreen({super.key});
  TextEditingController _nameController = new TextEditingController(text: "");
  TextEditingController _ageController = new TextEditingController(text: "");
  TextEditingController _jobController = new TextEditingController(text: "");

  Widget _body(context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: [
              _inputField(_nameController, "name"),
              _inputField(_ageController, "age"),
              _inputField(_jobController, "job"),
            ],
          ),
          BlocBuilder<UserBloc, UserStates>(
            builder: (context, state) {
              if (state is InitialState || state is UpdateState) {
                return MaterialButton(
                  color: Colors.green,
                  elevation: 0.0,
                  height: 50,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Text(
                    "Add User",
                    style: TextStyle(fontSize: 22, color: Colors.white),
                  ),
                  onPressed: () {
                    context.read<UserBloc>().add(AddUserEvent(UserBlocModel(name: _nameController.text, age: _ageController.text, job: _jobController.text)));
                    Navigator.of(context).pop();
                  },
                );
              }
              return Container();
            },
          ),
        ],
      ),
    );
  }

  Container _inputField(controller, hintText) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
      child: Container(
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            hintText: hintText,
            contentPadding: EdgeInsets.only(left: 8.0),
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _body(context),
    );
  }
}
