import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monature/Screens/camera.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CupertinoColors.lightBackgroundGray,
      body: Center(
        child: IconButton(
          onPressed: () {Navigator.push(
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
      ),
    );
  }
}
