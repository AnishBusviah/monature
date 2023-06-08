import 'package:elliptic_text/elliptic_text.dart';
import 'package:flutter/material.dart';
import 'package:monature/Screens/authorities.dart';
import 'package:monature/Screens/encyclopedia.dart';
import 'package:monature/Screens/identify.dart';
import 'package:monature/Screens/loginScreen.dart';
import 'package:monature/Screens/mixedEncyclopedia.dart';
import 'package:monature/Widgets/drawer.dart';

import '../Screens/home.dart';
import 'package:get/get.dart';

class MoNature extends StatelessWidget {
  const MoNature({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: BottomNavBar(),
    );
  }
}

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentScreen = 0;

  static const List<Widget> _screenOptions = <Widget>[
    Home(),
    // MixedEncyclopedia(),
    // Identify(),
    Authorities(),
    LoginScreen(),
  ];

  static const List<String> _appBarTitles = <String>[
    "Home",
    // "Encyclopedia",
    // "Identify",
    "Authorities",
    "Profile",
  ];

  List<Widget> _screenAppBar = <Widget>[
    homeAppBar(),
    regularAppBar(_appBarTitles[1]),
    regularAppBar(_appBarTitles[2]),
  ];

  void _changeScreen(int index) {
    setState(() {
      _currentScreen = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: _currentScreen == 0
            ? homeAppBar()
            : regularAppBar(_appBarTitles[_currentScreen]),
        drawer: DrawerWidget(),
        body: Center(
          child: _screenOptions.elementAt(_currentScreen),
        ),
        bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            // BottomNavigationBarItem(
            //   icon: ImageIcon(AssetImage("assets/icons/Encyclopedia.png")),
            //   label: 'Encyclopedia',
            // ),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.camera_alt),
            //   label: 'Identify',
            // ),
            BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/icons/Authorities.png')),
              label: 'Authorities',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          unselectedItemColor: Colors.black,
          unselectedLabelStyle: TextStyle(color: Colors.black),
          currentIndex: _currentScreen,
          selectedItemColor: Colors.amber[800],
          onTap: _changeScreen,
        ),
      ),
    );
  }
}

PreferredSize homeAppBar() {
  return PreferredSize(
      preferredSize: Size.fromHeight(800),
      child: AppBar(
          backgroundColor: Colors.white,
          title: const Text("Home"),
          flexibleSpace: Scaffold(
            body: Stack(
              children: [
                Container(
                  height: 300,
                  width: 500,
                  color: Color.fromRGBO(0, 0, 0, 0.5),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120, left: 20),
                    child: EllipticText(text: "Identify A Specimen", style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),

                      ),
                    ),

                  height: 300,
                  width: 500,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          opacity: 0.9,
                          image: AssetImage('assets/a deer silhouet 1 (1).png'),
                          fit: BoxFit.fill)),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Home(),
                )
              ],
            ),
          )));
}

AppBar regularAppBar(String title) {
  return AppBar(
      title: Text(
        title,
        style: TextStyle(color: Colors.black),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      iconTheme: IconThemeData(color: Colors.black));
}
