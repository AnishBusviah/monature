import 'package:flutter/material.dart';

class MixedEncyclopedia extends StatefulWidget {
  const MixedEncyclopedia({Key? key}) : super(key: key);

  @override
  State<MixedEncyclopedia> createState() => _MixedEncyclopediaState();
}

class _MixedEncyclopediaState extends State<MixedEncyclopedia> {
  @override
  Widget build(BuildContext context) {
    return Center(child: Text("Mixed Encyclopedia"),);
  }
}
