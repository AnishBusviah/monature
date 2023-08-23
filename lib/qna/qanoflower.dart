import 'package:flutter/material.dart';
import 'qaother.dart';

class nofloweroption extends StatelessWidget {
  const nofloweroption({super.key});

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
            //Mauritian Baobab
            child: Column(
              children: [
                SizedBox(height: 100, width: 100, child: Image.network("https://www.llifle.com/photos/Cyphostemma_mappia_28464_l.jpg", fit: BoxFit.cover,),),
              Text("Bois Mapou")],
            )
          ),
          
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => otheroption()));
            },
            
            child: SizedBox(height: 20, width: 100, child: const Text('Not Found', textAlign: TextAlign.center,),)
          ),
        ],
      ),
    ),
    );
  }
}
