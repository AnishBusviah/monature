import 'package:flutter/material.dart';
import 'qaother.dart';

class lizardoption extends StatelessWidget {
  const lizardoption({super.key});

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
            //Mauritius ornate day gecko-------------------------------
            child: SizedBox(height: 100, width: 100, child: Image.network("https://www.biolib.cz/IMG/GAL/152568.jpg", fit: BoxFit.cover,),)
          
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Blue-tailed day gecko
            child: SizedBox(height: 100, width: 100, child: Image.network("https://static.inaturalist.org/photos/46025115/large.jpg", fit: BoxFit.cover,),),
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
