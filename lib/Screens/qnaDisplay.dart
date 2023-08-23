import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:monature/Model/species.dart';
import '../Widgets/carouselSlider.dart';

class QNADisplay extends StatefulWidget {
  Map<String, dynamic> speciesData;


  QNADisplay({Key? key, required this.speciesData}) : super(key: key);

  @override
  State<QNADisplay> createState() => _QNADisplayState();
}

class _QNADisplayState extends State<QNADisplay> {
  late String englishName;
  late String frenchName;
  late String scientificName;
  late String type;
  late String plantDescription;
  late String plantGrowthCondition;
  late String image1;
  late String image2;
  late String image3;
  late Species results;


  double paddingTextTop = 20;
  double paddingTextLeft = 20;

getData() async{
  setState(() {
    results = Species.fromJson(widget.speciesData
    );


    englishName = results.englishName;
    frenchName = results.frenchName;
    scientificName = results.scientificName;
    plantDescription = results.englishDescription;
    plantGrowthCondition = results.growthCondition;
    image1 = results.image1;
    image2 = results.image2;image3 = results.image3;


  });
}


  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 40),
            child: Text(
              "Result",
              style: titleStyle(),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    child: CarouselSlider(children: [
                      Image.network(image1)
                    ]),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingTextTop, left: paddingTextLeft),
                    child: Row(
                      children: [
                        Text(
                          'English Name: ',
                          style: descriptionTitleStyle(),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                           englishName,
                            style: descriptionStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingTextTop, left: paddingTextLeft),
                    child: Row(
                      children: [
                        Text(
                          'French Name: ',
                          style: descriptionTitleStyle(),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            frenchName,
                            style: descriptionStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingTextTop, left: paddingTextLeft),
                    child: Row(
                      children: [
                        Text(
                          'Scientific Name: ',
                          style: descriptionTitleStyle(),
                        ),
                        SizedBox(
                          width: 120,
                          child: Text(
                            scientificName,
                            style: descriptionStyle(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingTextTop, left: paddingTextLeft),
                    child: Row(
                      children: [
                        Text(
                          'Type: ',
                          style: descriptionTitleStyle(),
                        ),
                        Text(
                          type,
                          style: descriptionTypeStyle(),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingTextTop, left: paddingTextLeft),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Description: ',
                          style: descriptionTitleStyle(),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 5, right: 30),
                          child: Expanded(
                            child: SizedBox(
                              width: 300,
                              child: Text(
                                plantDescription,
                                style: descriptionStyle(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  plantGrowthCondition == "null"
                      ? Container()
                      : Padding(
                          padding: EdgeInsets.only(
                              top: paddingTextTop,
                              left: paddingTextLeft,
                              bottom: 30),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ideal Condition To Grow: ',
                                style: descriptionTitleStyle(),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Expanded(
                                  child: Text(
                                    plantGrowthCondition,
                                    style: descriptionStyle(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 6 / 7 * MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Back'))),
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                      onPressed: () {
                        // _showMyDialog();
                      },
                      child: Text('  Contact\nAuthorities')),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
TextStyle titleStyle() {
  return TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
}

TextStyle descriptionStyle() {
  return TextStyle(fontSize: 20);
}

TextStyle descriptionTypeStyle() {
  return TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: Colors.redAccent);
}

TextStyle descriptionTitleStyle() {
  return TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}


