import 'package:flutter/material.dart';
import 'qaother.dart';

class birdoption extends StatelessWidget {
  const birdoption({super.key});

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
            //Mauritius fody
            child: SizedBox(height: 100, width: 100, child: Image.network("https://cdn.download.ams.birds.cornell.edu/api/v1/asset/260987981/1800", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Paradise flycatcher
            child: SizedBox(height: 100, width: 100, child: Image.network("https://static.inaturalist.org/photos/80783520/large.jpeg", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Mauritius cuckoo shrike
            child: SizedBox(height: 100, width: 100, child: Image.network("https://www.birdguides-cdn.com/cdn/gallery/birds/MacchabeeTrail066.jpg?&format=webp&webp.quality=85&scale=down", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Olive white-eye
            child: SizedBox(height: 100, width: 100, child: Image.network("https://cdn.download.ams.birds.cornell.edu/api/v1/asset/260741311/1800", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Rodrigues Fody
            child: SizedBox(height: 100, width: 100, child: Image.network("https://cdn.download.ams.birds.cornell.edu/api/v1/asset/261372011/1800", fit: BoxFit.cover,),)
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
