import 'package:flutter/material.dart';
import 'package:time_line/presentantion/Screens/ScreenHome/DrawerEvent.dart';
import 'package:time_line/presentantion/Screens/ScreenHome/Interactive.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int este = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        actions: [
          SizedBox(
            height: 60,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Row(
                  children: [
                    SizedBox(
                      width: 250,
                      height: 30,
                      child: TextField(
                        style: TextStyle(fontSize: 14),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25),
                            ),
                          ),
                          contentPadding: EdgeInsets.only(left: 10, right: 10),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Image(
                      image: AssetImage('assets/Icons/loupe.png'),
                      height: 30,
                    ),
                  ],
                ),
                Container(
                  width: 25,
                  height: 25,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Icons/user.png'))),
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerEvent(),
      ),
      resizeToAvoidBottomInset: false,
      body: Center(
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
    );
  }
}
