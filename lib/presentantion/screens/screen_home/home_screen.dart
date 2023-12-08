import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              debugPrint("Clicou"),
              Navigator.of(context).popAndPushNamed("/TimeLineExemple")
            },
            child: const Text("Go to the Time Line"),
          ),
        ),
      ),
    );
  }
}
