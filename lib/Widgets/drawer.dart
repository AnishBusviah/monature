import 'package:flutter/material.dart';
import 'package:monature/Screens/encyclopedia.dart';
import 'package:monature/Screens/natureReserve.dart';
import 'package:monature/Screens/natureReserves.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(children: [
        SizedBox(
          height: 200,
          child: DrawerHeader(
            decoration: BoxDecoration(color: Color.fromRGBO(154, 177, 6, 1), ),
            child: Column(
              children: [
                SizedBox(
                  height:100 ,
                    child: Image.asset("assets/logo.png")),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text("Mo Nature", style: TextStyle(fontSize: 24),),
                ),
              ],
            ),
          ),
        ),
        ExpansionTile(
          title: Text("Plant"),
          //leading: Icon(Icons.person), //add icon
          childrenPadding: EdgeInsets.only(left: 60), //children padding
          children: [
            ListTile(
              title: Text("Endemic"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Encyclopedia(
                              speciesType: "Endemic",isPlant: true,
                            )));
              },
            ),

            ListTile(
              title: const Text('Exotic'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Encyclopedia(
                              speciesType: "Exotic", isPlant: true,
                            )));
              },
            ),
            ListTile(
              title: const Text('Invasive'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Encyclopedia(
                              speciesType: "Invasive", isPlant: true,
                            )));
              },
            ),

            //more child menu
          ],
        ),
        ExpansionTile(
          title: Text("Animal"),
          //leading: Icon(Icons.person), //add icon
          childrenPadding: EdgeInsets.only(left: 60), //children padding
          children: [
            ListTile(
              title: Text("Endemic"),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Encyclopedia(
                          speciesType: "Endemic", isPlant: false,
                        )));
              },
            ),

            ListTile(
              title: const Text('Exotic'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Encyclopedia(
                          speciesType: "Exotic", isPlant: false,
                        )));
              },
            ),
            ListTile(
              title: const Text('Invasive'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Encyclopedia(
                          speciesType: "Invasive", isPlant: false,
                        )));
              },
            ),

            //more child menu
          ],
        ),

        ListTile(
          title: const Text('Nature Reserves'),
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NatureReserveList()));
          },
        ),

        ListTile(
          title: const Text('About Us'),
          onTap: () {

          },
        ),
      ]),
    );
  }
}
