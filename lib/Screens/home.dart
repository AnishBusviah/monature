import 'package:flutter/material.dart';
import 'package:monature/Screens/Camera.dart';


class Home extends StatefulWidget {
  const Home( {Key? key}) : super(key: key);



  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        onPressed: () {InitialiseCamera() ; Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
              const CameraRoute("Identify Species")),
        );},
        icon: const Icon(
          Icons.camera_alt,
          size: 48,
        ),
      ),
    );
  }
}
