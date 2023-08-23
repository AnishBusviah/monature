import 'package:flutter/material.dart';
import 'qaqns.dart';

void main() {
  runApp(const MoNature());
}

class MoNature extends StatefulWidget {
  const MoNature({super.key});

  @override
  State<MoNature> createState() => _MoNatureState();
}

class _MoNatureState extends State<MoNature> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: qa(),
    );
  }
}
