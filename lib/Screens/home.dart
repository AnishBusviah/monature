import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monature/Model/species.dart';
import 'package:monature/Screens/Camera.dart';
import 'package:monature/Screens/ConfirmPicture.dart';
import 'package:monature/Widgets/imageCarousel.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<void> pickImage() async {
    var picker;
    picker = ImagePicker();
    var imageFile = null;
    imageFile = await picker.pickImage(source: ImageSource.gallery);

    var image = null;
    image = File(imageFile!.path);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            displayPicture(image, "gallery", "Confirm Picture?"),
      ),
    );
  } //pickImage

  List<Species>  endemicAnimal = [];
  List<Species> exoticAnimal = [];
  List<Species> invasiveAnimal = [];
  List<Species> endemicPlant = [];
  List<Species>  exoticPlant = [];
  List<Species>  invasivePlant = [];

  List<List<Species>> allSpecies = [];

  readAndClassify() async {
    final speciesData = await rootBundle.loadString('assets/Species.json');
    final decodedData = await jsonDecode(speciesData);
    final identifiedSpeciesData = decodedData["SpeciesData"];

    for (var specimen in identifiedSpeciesData) {
      Species identifiedSpicies = Species.fromJson(specimen);

      setState(() {
        if (identifiedSpicies.growthCondition == "null") {
          if (identifiedSpicies.specie == "Endemic") {
            endemicAnimal.add(identifiedSpicies);
          } else if (identifiedSpicies.specie == "Exotic") {
            exoticAnimal.add(identifiedSpicies);
          } else {
            invasiveAnimal.add(identifiedSpicies);
          }
        } else {
          if (identifiedSpicies.specie == "Endemic") {

            endemicPlant.add(identifiedSpicies);
          } else if (identifiedSpicies.specie == "Exotic") {
            exoticPlant.add(identifiedSpicies);
          } else {
            invasivePlant.add(identifiedSpicies);
          }
        }
      });
    }
    ;
  }

  @override
  void initState() {
    readAndClassify();
    setState(() {
      allSpecies.add(endemicPlant);
      allSpecies.add(endemicAnimal);
      allSpecies.add(exoticPlant);
      allSpecies.add(endemicAnimal);
      allSpecies.add(invasivePlant);
      allSpecies.add(invasiveAnimal);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: IconButton(
                        onPressed: () {
                          InitialiseCamera();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CameraRoute("Identify Species")),
                          );
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 40,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Camera",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: IconButton(
                        onPressed: () {
                          pickImage();
                        },
                        icon: Icon(
                          Icons.image,
                          size: 40,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Gallery",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.green,
                    ),
                    child: IconButton(
                        onPressed: () {
                          InitialiseCamera();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    const CameraRoute("Identify Species")),
                          );
                        },
                        icon: Icon(
                          Icons.question_answer,
                          size: 40,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(
                      "Q&A",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
              // color: Colors.red,
              height: 440,
              child: SingleChildScrollView(
                child: Column(children: [
                  ImageCarousel(speciesData: endemicPlant),
                  ImageCarousel(speciesData: endemicAnimal),
                  ImageCarousel(speciesData: exoticPlant),
                  ImageCarousel(speciesData: exoticAnimal),
                  ImageCarousel(speciesData: invasivePlant),
                  ImageCarousel(speciesData: invasiveAnimal),
                ]),
              ))
        ],
      ),
    );
  }
}
