import 'package:flutter/material.dart';
import 'package:monature/Processes/modelConfig.dart';
import 'package:monature/Screens/camera.dart';

import './Widgets/bottomNavBar.dart';

Future<void> main() async {

  InitialiseCamera();
  loadModel();



  runApp(const MoNature(),
  );
}



