import 'package:flutter/material.dart';
import 'qaother.dart';

class snailoption extends StatelessWidget {
  const snailoption({super.key});

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
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Scaly-foot snail
            child: SizedBox(height: 100, width: 100, child: Image.network("https://upload.wikimedia.org/wikipedia/commons/0/08/Chrysomallon_squamiferum_9.png", fit: BoxFit.cover,),)
          ),
          
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => otheroption()));
            },
            child: const Text('Not Found'),
          ),
        ],
      ),
    ),
    );
  }
}
