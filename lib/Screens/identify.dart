import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:monature/Screens/Camera.dart';
import 'package:monature/Screens/ConfirmPicture.dart';
import 'package:monature/Widgets/galleryImagePicker.dart';

class Identify extends StatefulWidget {
  const Identify({Key? key}) : super(key: key);

  @override
  State<Identify> createState() => _IdentifyState();
}

class _IdentifyState extends State<Identify> {

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            IconButton(
              onPressed: () {
                InitialiseCamera();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const CameraRoute("Identify Species")),
                );
              },
              icon: const Icon(
                Icons.camera_alt,
                size: 48,
              ),
            ),
            Text("Camera", style: iconLabelStyle(),),
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {
                  pickImage();
                },
                icon: const Icon(
                  Icons.image,
                  size: 48,
                )),
            Text("Import From Gallery", style: iconLabelStyle(),),
          ],
        ),
        Column(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(Icons.question_answer, size: 48,)),
            Text("Question & Answers", style: iconLabelStyle(),),
          ],
        ),
      ],
    );
  }
}

TextStyle iconLabelStyle (){
  return const TextStyle(fontSize: 20);
}
