import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/presentantion/screens/screen_home/screen_home.dart';
import 'package:time_line/provider/event_controller.dart';
import 'package:time_line/provider/time_line_controller.dart';
import 'package:time_line/provider/repository_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RepositoryController()),
        ChangeNotifierProvider(create: (_) => TimeLineController()),
        ChangeNotifierProvider(create: (_) => EventController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: ScreenHome(),
      ),
    );
  }
}
