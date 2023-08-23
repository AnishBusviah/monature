import 'package:flutter/material.dart';
import 'qaother.dart';

class mammaloption extends StatelessWidget {
  const mammaloption({super.key});

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
            //Rodrigues Flying Fox
            child: SizedBox(height: 100, width: 100, child: Image.network("https://sdzwildlifeexplorers.org/sites/default/files/2019-12/fruit-bat-face.jpg", fit: BoxFit.cover,),),
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
