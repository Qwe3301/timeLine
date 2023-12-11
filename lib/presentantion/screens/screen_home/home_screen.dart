import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/provider/repository_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    RepositoryController a = Provider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Time Line Menu"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child: ElevatedButton(
            onPressed: () => {
              a.converteToEventModel(),
              print(a.read().first.startDate),
              Navigator.of(context).popAndPushNamed("/TimeLineExemple")
            },
            child: const Text("Go to the Time Line"),
          ),
        ),
      ),
    );
  }
}
