// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:bloctest/bloc/internetbloc/internet_states.dart';
import 'package:bloctest/bloc/internetbloc/internetblocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomeScreen extends StatelessWidget {
  const MyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: BlocConsumer<InternetBloc, InternetStates>(
              listener: (context, state) {
                if (state is InternetGainedStates) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("Internet Connected! "),
                      backgroundColor: Colors.green,
                    ),
                  );
                } else if (state is InternetLostStates) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(" No Internet"),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                if (state is InternetGainedStates) {
                  return Text("Conntected!");
                } else if (state is InternetLostStates) {
                  return Text("Disconnected to internet!");
                } else {
                  return Text("Loading.....");
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
