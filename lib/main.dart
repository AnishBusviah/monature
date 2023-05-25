import 'package:flutter/material.dart';
import 'package:monature/Processes/modelConfig.dart';
import 'package:monature/Screens/camera.dart';
import 'package:monature/Screens/home.dart';

void main() {
  InitialiseCamera();
  loadModel();

  runApp(const MaterialApp(
    home: Home(),
  ));
}



