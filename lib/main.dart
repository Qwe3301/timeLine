import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/presentantion/Screens/ScreenHome/ScreenHome.dart';
import 'package:time_line/provider/EventController.dart';
import 'package:time_line/provider/TimeLineController.dart';
import 'package:time_line/provider/repositoryController.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SafeArea(
        child: ScreenHome(),
      ),
    );
  }
}
