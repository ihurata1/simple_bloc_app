import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:simple_bloc_app/bloc/user/bloc.dart';
import 'package:simple_bloc_app/bloc/user/event.dart';
import 'package:simple_bloc_app/bloc/user/state.dart';
import 'package:simple_bloc_app/constant/list.dart';
import 'package:simple_bloc_app/model/user.dart';
import 'package:simple_bloc_app/screens/users/add.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar,
      body: _body(context),
    );
  }

  Widget _body(context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BlocBuilder<UserBloc, UserStates>(
          builder: (context, state) {
            print(state.toString());
            if (state is InitialState) {
              return _userListField(context, AppLists.users);
            }
            if (state is UpdateState) {
              return _userListField(context, state.list);
            }
            return Container();
          },
        ),
        MaterialButton(
          color: Colors.green,
          elevation: 0.0,
          height: 50,
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
          child: const Text(
            "Add User",
            style: TextStyle(fontSize: 22, color: Colors.white),
          ),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddUserScreen()));
          },
        ),
      ],
    );
  }

  Widget _userListField(context, list) {
    return ListView(
      shrinkWrap: true,
      children: List.generate(
        list.length,
        (index) => Card(
          child: ListTile(
            title: Text(list[index].name!, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            subtitle: Text("${list[index].age!}\n${list[index].job!} ", style: const TextStyle(fontSize: 14)),
            trailing: BlocBuilder<UserBloc, UserStates>(
              builder: (context, state) {
                return MaterialButton(
                  color: Colors.red,
                  elevation: 0.0,
                  height: 40,
                  shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                  child: const Icon(Icons.delete_outline_rounded, color: Colors.white),
                  onPressed: () {
                    context.read<UserBloc>().add(DeleteUserEvent(list[index]));
                  },
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  /* Widget get _a {
    return BlocBuilder<CounterBloc, CounterStates>(
      builder: (context, state) {
        print(state.toString());
        if (state is InitialState) {
          return _counter(context, 0);
        }
        if (state is UpdateState) {
          return _counter(context, state.counter);
        }
        return Center(child: Text("No Connection"));
      },
    );
  }*/

  AppBar get _appBar {
    return AppBar(
      title: const Text("Simple Bloc App", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
      centerTitle: true,
      backgroundColor: Colors.indigo,
    );
  }

  /*Widget _counter(BuildContext context, int counter) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            counter.toString(),
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.red,
                elevation: 0.0,
                height: 50,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "-",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberDecreaseEvent());
                },
              ),
              const SizedBox(
                width: 50,
              ),
              MaterialButton(
                color: Colors.green,
                elevation: 0.0,
                height: 50,
                shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(8))),
                child: const Text(
                  "+",
                  style: TextStyle(fontSize: 22, color: Colors.white),
                ),
                onPressed: () {
                  context.read<CounterBloc>().add(NumberIncreaseEvent());
                },
              ),
            ],
          )
        ],
      ),
    );
  }*/
}
