import 'package:flutter/material.dart';

class Encyclopedia extends StatefulWidget {
  const Encyclopedia({Key? key}) : super(key: key);

  @override
  State<Encyclopedia> createState() => _EncyclopediaState();
}

class _EncyclopediaState extends State<Encyclopedia> {
  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Encyclopedia"),);
  }
}
