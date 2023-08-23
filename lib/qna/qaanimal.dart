import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import '../qna/qaanimal.dart';
import '../qna/qalizard.dart';
import '../qna/qamammals.dart';
import '../qna/qasnail.dart';
import 'qabird.dart';
import 'qaother.dart';

class animaloption extends StatefulWidget {
  const animaloption({super.key});

  @override
  State<animaloption> createState() => _animaloptionState();
}

class _animaloptionState extends State<animaloption> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => birdoption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Bird', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => lizardoption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Lizard', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => snailoption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Snail', textAlign: TextAlign.center,),)
            
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => mammaloption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Mammals', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => otheroption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Other', textAlign: TextAlign.center,),)
          ),
        ],
      ),
    ),
    );
  }
}
