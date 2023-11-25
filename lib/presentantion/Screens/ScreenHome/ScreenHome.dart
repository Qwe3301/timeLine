import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:time_line/presentantion/Screens/ScreenHome/DrawerEvent.dart';
import 'package:time_line/presentantion/Screens/ScreenHome/Interactive.dart';
import 'package:time_line/data/dataFake/DataFake.dart';

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
      drawer: Drawer(
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
                  SizedBox(
                    height: 60,
                    width: size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: 25,
                          height: 25,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/Icons/menu.png'))),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          width: 250,
                          decoration: BoxDecoration(
                            color: const Color(0xffD7D7D7),
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: TextField(
                              decoration: InputDecoration(
                            border: InputBorder.none,
                            suffix: Container(
                              width: 20,
                              height: 20,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Icons/loupe.png'))),
                            ),
                          )),
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
