import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:monature/Model/species.dart';
import '../Widgets/carouselSlider.dart';

class DisplayScreen extends StatefulWidget {
  String plantImageURL;
  String screenTitle;
  String englishName;
  String frenchName;
  String scientificName;
  String type;
  String plantDescription;
  String plantGrowthCondition;

  var results;

  Image image1 = Image.network(
      "https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/-Insert_image_here-.svg/480px--Insert_image_here-.svg.png?20220802103107");
  Image image2 = Image.network('https://www.w3.org/Graphics/PNG/alphatest.png');
  Image image3 = Image.network(
      'https://cms.hugofox.com//resources/images/a0fea022-8ec7-4a37-b4e7-214846e7656f.jpg');

  DisplayScreen({
    Key? key,
    this.screenTitle = 'Results',
    this.plantImageURL =
        'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c9/-Insert_image_here-.svg/480px--Insert_image_here-.svg.png?20220802103107',
    this.englishName = 'English Name',
    this.frenchName = 'French Name',
    this.scientificName = 'Scientific Name',
    this.type = 'Type',
    this.plantDescription = 'Plant Description blah blah blah more words ',
    this.plantGrowthCondition =
        'Plant Growth Condition blah blah blah more words ',
    this.results,
  }) : super(key: key);

  @override
  State<DisplayScreen> createState() => _DisplayScreenState();
}

class _DisplayScreenState extends State<DisplayScreen> {
  double paddingTextTop = 20;
  double paddingTextLeft = 20;

  readJson(int index) async {
    final speciesData = await rootBundle.loadString('assets/Species.json');
    final decodedData = await jsonDecode(speciesData);
    final identifiedSpeciesData = decodedData["SpeciesData"][index];

    Species identifiedSpicies = Species.fromJson(identifiedSpeciesData);

    setState(() {
      widget.englishName = identifiedSpicies.englishName;
      widget.frenchName = identifiedSpicies.frenchName;
      widget.scientificName = identifiedSpicies.scientificName;
      widget.type = identifiedSpicies.specie;
      widget.plantDescription = identifiedSpicies.englishDescription;
      widget.plantGrowthCondition = identifiedSpicies.growthCondition;
      widget.image1 = Image.network(identifiedSpicies.image1);
      widget.image2 = Image.network(identifiedSpicies.image2);
      widget.image3 = Image.network(identifiedSpicies.image3);
    });
  }


  sendEmail() async {
    final Email email = Email(
      body: 'Dear Sir/Madam,\n\nThis email is to inform you about the discovery of an Endemic Specimen at ...',
      subject: 'Reporting Discovery of an Endemic Specimen at New Location',
      recipients: ['developer16052023@gmail.com'],
      // cc: ['cc@example.com'],
      // bcc: ['bcc@example.com'],
      // attachmentPaths: ['/path/to/attachment.zip'],
      isHTML: false,
    );

    await FlutterEmailSender.send(email);
  }


  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Contact Authorities'),
          content:  SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('This specimen will be reported to Natural Wildlife Foundation.'),
                Text('Do you wish to continue?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),TextButton(
              child: const Text('Approve'),
              onPressed: () {
                sendEmail();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    try {
      int index = widget.results[0]['index'];
      readJson(index);
    } catch (e) {


      setState(() {
        widget.englishName = widget.results.englishName;
        widget.frenchName = widget.results.frenchName;
        widget.scientificName = widget.results.scientificName;
        widget.type = widget.results.specie;
        widget.plantDescription = widget.results.englishDescription;
        widget.plantGrowthCondition = widget.results.growthCondition;
        widget.image1 = Image.network(widget.results.image1);
        widget.image2 = Image.network(widget.results.image2);
        widget.image3 = Image.network(widget.results.image3);
      });
    }

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
              widget.screenTitle,
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
                      widget.image1,
                      widget.image2,
                      widget.image3
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
                            widget.englishName,
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
                        SizedBox(width: 120,
                          child: Text(
                            widget.frenchName,
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
                            widget.scientificName,
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
                          widget.type,
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
                                widget.plantDescription,
                                style: descriptionStyle(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  widget.plantGrowthCondition == "null"? Container() :
                  Padding(
                    padding: EdgeInsets.only(
                        top: paddingTextTop, left: paddingTextLeft, bottom: 30),
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
                              widget.plantGrowthCondition,
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
                      onPressed: () {_showMyDialog();}, child: Text('  Contact\nAuthorities')),
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


