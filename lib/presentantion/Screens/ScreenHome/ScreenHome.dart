import 'package:flutter/material.dart';
import 'package:time_line/presentantion/Class/Delegate.dart';
import 'package:time_line/presentantion/modules/DrawerEvent.dart';
import 'package:time_line/presentantion/Screens/ScreenHome/Interactive.dart';
import 'package:time_line/presentantion/modules/Search.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int este = 0;
  bool isSearching = false;
  FocusNode isSearchingFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    isSearchingFocus.addListener(() {
      setState(() {
        isSearching = isSearchingFocus.hasFocus;
      });
    });

    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: SizedBox(
          height: 60,
          width: size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      showSearch(context: context, delegate: EventSearch());
                    },
                    child: Container(
                      width: 180,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Image(
                    image: AssetImage('assets/Icons/loupe.png'),
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Image.asset(
              'assets/images/Icons/user.png',
              height: 40,
            ),
          )
        ],
      ),
      drawer: const Drawer(
        child: DrawerEvent(),
      ),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: Center(
                child: SizedBox(
                  width: size.width,
                  height: size.height,
                  child: Column(
                    children: [
                      const Center(child: InteractiveModule()),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //if (isSearching) SearchModule()
        ],
      ),
    );
  }
}
