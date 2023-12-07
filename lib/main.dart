import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/presentantion/screens/screen_home/home_screen.dart';
import 'package:time_line/presentantion/screens/screen_home/time_line_exemple.dart';
import 'package:time_line/provider/event_controller.dart';
import 'package:time_line/provider/search_controller.dart';
import 'package:time_line/provider/time_line_controller.dart';
import 'package:time_line/provider/repository_controller.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => RepositoryController()),
        ChangeNotifierProvider(create: (_) => TimeLineController()),
        ChangeNotifierProvider(create: (_) => EventController()),
        ChangeNotifierProvider(create: (_) => Search_Controller()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
        ),
        initialRoute: "/",
        routes: {
          "/": (_) => const HomeScreen(),
          "/TimeLineExemple": (_) => const TimeLineHomeExemple(),
        },
      ),
    );
  }
}
