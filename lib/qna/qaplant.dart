import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'qapalmleaves.dart';
import 'qaflower.dart';
import 'qanoflower.dart';
import 'qaplantother.dart';
import 'qaother.dart';

class plantoption extends StatelessWidget {
  const plantoption({super.key});

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
                  MaterialPageRoute(builder: (context) => palmoption()));
            },
            
            child: SizedBox(width: 100, child: const Text('With palm type of leaves', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => floweroption()));
            },
            
            child: SizedBox( width: 100, child: const Text('With flowers', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => nofloweroption()));
            },
            
            child: SizedBox( width: 100, child: const Text('With no flowers', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => otheroption()));
            },
            
            child: SizedBox( width: 100, child: const Text('Other', textAlign: TextAlign.center,),)
          ),
        ],
      ),
    ),
    );
  }
}
