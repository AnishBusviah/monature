import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monature/Model/species.dart';
import 'package:monature/Screens/displayScreen.dart';
import 'package:monature/Screens/qnaDisplay.dart';
import 'qaother.dart';

class floweroption extends StatefulWidget {
  const floweroption({super.key});

  @override
  State<floweroption> createState() => _floweroptionState();
}

class _floweroptionState extends State<floweroption> {
  var allData;
  var result;

  readJson() async {
    final speciesData = await rootBundle.loadString('assets/Species.json');
    final decodedData = await jsonDecode(speciesData);
    final identifiedSpeciesData = decodedData["SpeciesData"];

    // int count = 0;

    setState(() {
      allData = identifiedSpeciesData;
    });
  }

  @override
  void initState() {
    readJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ElevatedButton(
            //style: style,
            onPressed: () { setState(() {
              result = allData[0];
            });
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => QNADisplay(speciesData: result,)));
            },
            //Earring tree-------------------------------------------------------
            child: SizedBox(height: 100, width: 100, child: Image.network("https://cdn.shopify.com/s/files/1/0634/0997/9621/products/trochetia-boutoniananational-flower-of-mauritius-kadiyam-nursery-1_grande.jpg?v=1662198707", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
           //Ebony tree-----------------------------------------------------------
            child: SizedBox(height: 100, width: 100, child: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTWOcHIoh60jHSotWxYT89r_zfF5U8wXixrSQ&usqp=CAU", fit: BoxFit.cover,),)
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
           //Strawberry Gouava--------------------------------
            child: SizedBox(height: 100, width: 100, child: Image.network("https://cdn.shopify.com/s/files/1/0099/6897/5931/products/2274_redstrawberryguava-full.jpg?v=1575430746", fit: BoxFit.cover,),),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Ardisia
            child: SizedBox(height: 100, width: 100, child: Image.network("https://upload.wikimedia.org/wikipedia/commons/2/28/Ardisia_crenata_plant.jpg", fit: BoxFit.cover,),),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Placeholder()));
            },
            //Agave -------------------------
            child: SizedBox(height: 100, width: 100, child: Image.network("https://upload.wikimedia.org/wikipedia/commons/2/21/Agave_americana_R01.jpg", fit: BoxFit.cover,),),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            //style: style,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => otheroption()));
            },

            child: SizedBox( width: 100, child: const Text('Not Found', textAlign: TextAlign.center,),),
          ),
        ],
      ),
    ),
    );
  }
}
