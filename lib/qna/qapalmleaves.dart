import 'package:flutter/material.dart';
import 'qaother.dart';

class palmoption extends StatelessWidget {
  const palmoption({super.key});

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
            
            //child: SizedBox( width: 100, child: const Text('Picture 1', textAlign: TextAlign.center,),)
            //blue latan palm-----------------------------------------
            child: SizedBox(height: 100, width:100, child: Image.network("https://upload.wikimedia.org/wikipedia/commons/6/60/Blue_Latan_%28Latania_loddigesii%29.jpg", fit: BoxFit.cover,),)
            
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //bottle palm-----------------------------------------------
            child: SizedBox(height: 100, width: 100, child: Image.network("https://www.bambooland.com.au/assets/full/HYOLAG.jpg?20220518162229", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            
            child: SizedBox(height: 100, width: 100, child: Image.network("https://www.bambooland.com.au/assets/full/HYOLAG.jpg?20220518162229", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Travller's Palm
            child: SizedBox(height: 100, width: 100, child: Image.network("https://images.squarespace-cdn.com/content/v1/544591e6e4b0135285aeb5b6/1513096681053-X0U5340EMMW6UTAMMZC7/Penang_Malaysia_Ravenala-madagascariensis-01.jpg?format=1000w", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Talipot palms
            child: SizedBox(height: 100, width: 100, child: Image.network("https://i0.wp.com/merwinconservancy.org/wp-content/uploads/2016/02/IMG_5605-1024x1024.jpg?resize=650%2C650", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => otheroption()));
            },
            
            child: SizedBox( width: 100, child: const Text('Not Found', textAlign: TextAlign.center,),)
          ),
        ],
      ),
    ));
  }
}
