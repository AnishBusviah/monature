import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';

class PreloaderAnimation extends StatefulWidget {
  @override
  _PreloaderAnimationState createState() => _PreloaderAnimationState();
}

class _PreloaderAnimationState extends State<PreloaderAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat(reverse: true);
    _animation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(_animationController);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.green[200]!, Colors.green[400]!],
          ),
        ),
        child: Center(
          child: FadeTransition(
            opacity: _animation,
            child: Image.asset(
              'assets/Pre_Loader.gif', // Replace with your GIF path
              width: 250,
              height: 250,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(PreloaderApp());
}

class PreloaderApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Preloader Animation',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PreloaderAnimation(),
    );
  }
}