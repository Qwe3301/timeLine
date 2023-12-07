import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.green,
        child: Center(
          child: ElevatedButton(
            onPressed: () => {
              debugPrint("Clicou"),
              Navigator.of(context).pushNamed("/TimeLineExemple")
            },
            child: const Text("Go to the Time Line"),
          ),
        ),
      ),
    );
  }
}
