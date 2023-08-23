import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'qaplant.dart';
import 'qaanimal.dart';

class qa extends StatefulWidget {
  const qa({super.key});

  @override
  State<qa> createState() => _qaState();
}

class _qaState extends State<qa> {
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
                  MaterialPageRoute(builder: (context) => plantoption()));
            },
            child: SizedBox(height: 20, width: 100, child: const Text('Plant', textAlign: TextAlign.center,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => animaloption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Animal', textAlign: TextAlign.center,),)
            
          ),
        ],
      ),
    ),
    );
  }
}
