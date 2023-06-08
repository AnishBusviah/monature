import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monature/Model/species.dart';
import 'package:monature/Screens/displayScreen.dart';

class Encyclopedia extends StatefulWidget {
  final String speciesType;
  final bool isPlant;

  const Encyclopedia(
      {Key? key, required this.speciesType, required this.isPlant})
      : super(key: key);

  @override
  State<Encyclopedia> createState() => _EncyclopediaState();
}

class _EncyclopediaState extends State<Encyclopedia> {
  @override
  List<Species> selectedSpecies = [];
  String title = "Encyclopedia";

  readJson(String speciesType, bool isPlant) async {
    final speciesData = await rootBundle.loadString('assets/Species.json');
    final decodedData = await jsonDecode(speciesData);
    final identifiedSpeciesData = decodedData["SpeciesData"];

    // int count = 0;

    for (var specimen in identifiedSpeciesData) {
      Species identifiedSpicies = Species.fromJson(specimen);

      setState(() {
        if (isPlant == true) {
          if (identifiedSpicies.specie == speciesType &&
              identifiedSpicies.growthCondition != "null") {
            selectedSpecies.add(identifiedSpicies);
            print(identifiedSpicies.growthCondition);
          }
        }
        if (isPlant == false) {
          if (identifiedSpicies.specie == speciesType &&
              identifiedSpicies.growthCondition == "null") {
            selectedSpecies.add(identifiedSpicies);
            print(identifiedSpicies.growthCondition);
          }
        }
      });

      // count++;
    }
  }

  void initState() {
    setState(() {
      if (widget.isPlant == true){
        title = "${widget.speciesType} Plants";
      }else{
        title = "${widget.speciesType} Animals";
      }
    });

    readJson(widget.speciesType, widget.isPlant);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text(title),),
        body: selectedSpecies.length ==0?  Center(child: Text("No Data Available"),) : Padding(
          padding: const EdgeInsets.only(top: 30, left: 17, bottom: 30),
          child: Container(
            //color: Colors.redAccent,

            width: 10/11 * MediaQuery.of(context).size.width,
            child: GridView.builder(
                gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.6),
                  mainAxisSpacing: 12.0,
                  crossAxisSpacing: 12.0,
                ),
                itemCount: selectedSpecies.length,
                itemBuilder: (BuildContext ctx, index) {
                  return Container(
                    color: Colors.redAccent,
                    width: 400,
                    // height: 200,
                    child: GestureDetector(
                      onTap: (){Navigator.push(context, MaterialPageRoute(builder:  (context)=> DisplayScreen(results: selectedSpecies[index],)));},
                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              // color: Colors.red,
                              height: 170,
                              width: 250,
                              child: FittedBox(fit: BoxFit.fill, child: selectedSpecies[index].image1 == null? CircularProgressIndicator() : Image.network(selectedSpecies[index].image1)),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(selectedSpecies[index].englishName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 6),
                            child: Text(selectedSpecies[index].scientificName),
                          )
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ),
      ),
    );
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
