import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:monature/Processes/modelConfig.dart';
import 'package:monature/Screens/camera.dart';

import './Widgets/bottomNavBar.dart';

Future<void> main() async {

  InitialiseCamera();
  loadModel();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MoNature(),
  );
}



