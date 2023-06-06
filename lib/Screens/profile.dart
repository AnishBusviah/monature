import 'package:flutter/material.dart';
import 'package:monature/auth.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){Auth().signOut();}, child: Text("Log Out"));
  }
}
