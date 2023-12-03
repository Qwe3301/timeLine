import 'package:flutter/material.dart';
import 'package:time_line/presentantion/modules/drawer_event.dart';
import 'package:time_line/presentantion/screens/screen_home/interactive.dart';
import 'package:time_line/presentantion/modules/search.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  int este = 0;
  bool isSearching = false;
  FocusNode isSearchingFocus = FocusNode();
  String textSearch = "";
  @override
  Widget build(BuildContext context) {
    isSearchingFocus.addListener(() {
      if (isSearchingFocus.hasFocus) {
        setState(() {
          isSearching = true;
        });
      } else {
        setState(() {
          isSearching = false;
        });
      }
    });
    var size = MediaQuery.of(context).size;

    return PopScope(
      canPop: !isSearching,
      onPopInvoked: (didPop) => isSearchingFocus.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: SizedBox(
            height: 60,
            width: size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 150,
                      height: 40,
                      child: TextField(
                        onChanged: (value) =>
                            setState(() => textSearch = value),
                        focusNode: isSearchingFocus,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(25),
                              ),
                            ),
                            contentPadding:
                                EdgeInsets.only(left: 10, right: 10)),
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
                    child: const Column(
                      children: [
                        Center(child: InteractiveModule()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (isSearching) SearchModule(textSerch: textSearch)
          ],
        ),
      ),
    );
  }
}
