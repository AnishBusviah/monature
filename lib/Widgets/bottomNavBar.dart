import 'package:flutter/material.dart';
import 'package:monature/Screens/loginScreen.dart';
import '../Screens/home.dart';
import 'package:get/get.dart';



class MoNature extends StatelessWidget {
  const MoNature( {super.key});


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
  State<BottomNavBar> createState() =>
      _BottomNavBarState();
}

class _BottomNavBarState
    extends State<BottomNavBar> {
  
  int _currentScreen = 0;
  
  

  static const List<Widget> _screenOptions = <Widget>[
    Home(),
    LoginScreen(),
  ];

  static const List<String> _appBarTitles = <String>[
    "Home",
    "Profile",
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
        resizeToAvoidBottomInset: false,


        body: Center(
          child: _screenOptions.elementAt(_currentScreen),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),

            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _currentScreen,
          selectedItemColor: Colors.amber[800],
          onTap: _changeScreen,
        ),
      ),
    );
  }
}
