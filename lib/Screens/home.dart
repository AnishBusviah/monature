import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monature/Screens/Camera.dart';
import 'package:monature/Screens/ConfirmPicture.dart';


class Home extends StatefulWidget {
  const Home( {Key? key}) : super(key: key);



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
        builder: (context) => displayPicture(image, "gallery", "Confirm Picture?"),
      ),
    );
  } //pickImage


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 200),
      child: Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  onPressed: () {InitialiseCamera() ; Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const CameraRoute("Identify Species")),
                  );},
                  icon: Icon(Icons.camera_alt, size: 40,)
                ),
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

          ),Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: IconButton(
                  onPressed: () {pickImage();},
                  icon: Icon(Icons.image, size: 40,)
                ),
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

          ),Column(
            children: [
              Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.green,
                ),
                child: IconButton(
                  onPressed: () {InitialiseCamera() ; Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const CameraRoute("Identify Species")),
                  );},
                  icon: Icon(Icons.question_answer, size: 40,)
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  "Q&A",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            ],

          ),

        ],
      ),
    );

  }
}
