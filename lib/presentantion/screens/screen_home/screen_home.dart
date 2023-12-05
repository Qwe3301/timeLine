import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_line/presentantion/modules/drawer_event.dart';
import 'package:time_line/presentantion/screens/screen_home/interactive.dart';
import 'package:time_line/presentantion/modules/search.dart';
import 'package:time_line/provider/search_controller.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  Widget build(BuildContext context) {
    Search_Controller searchController = Provider.of(context);

    searchController.addSearchListener();

    var size = MediaQuery.of(context).size;
    return PopScope(
      canPop: !searchController.isSearching,
      onPopInvoked: (didPop) => searchController.isSearchingFocus.unfocus(),
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
                        onChanged: (value) => setState(
                            () => searchController.changeTextSearch(value)),
                        focusNode: searchController.isSearchingFocus,
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
            if (searchController.isSearching)
              SearchModule(textSerch: searchController.textSearch)
          ],
        ),
      ),
    );
  }
}
