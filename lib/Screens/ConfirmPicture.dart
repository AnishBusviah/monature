import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:monature/Processes/modelConfig.dart';
import 'package:monature/Screens/resultScreen.dart';

import './Camera.dart';

class displayPicture extends StatefulWidget {
  const displayPicture(this.image, this.previousPage, this.title, {Key? key}) : super(key: key);


  final File image;
  final String previousPage;
  final String title;


  @override
  State<displayPicture> createState() => _displayPictureState();
}

class _displayPictureState extends State<displayPicture> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Confirm Picture?"),
        ),
        body: Center(
            child: Container(
              child: Image.file(widget.image),
            )),
        bottomNavigationBar: BottomAppBar(
          height: MediaQuery
              .of(context)
              .size
              .height * 1 / 7,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 1 / 7,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1 / 3,
                child: InkWell(

                  splashColor: Colors.redAccent,

                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                    CupertinoIcons.xmark,
                    size: 48,
                  ),
                ),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 1 / 7,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1 / 3,
                child: InkWell(
                  //highlightColor: Colors.yellowAccent,
                    splashColor: Colors.yellowAccent,
                    //splashRadius: 60,
                    onTap: () {
                      if (widget.previousPage == "gallery"){
                        CameraAppState camera = new CameraAppState();
                        camera.pickImage();
                      }else{
                        Navigator.pop(context);
                      }

                    },
                    child: Icon(
                      CupertinoIcons.refresh_thick,
                      size: 48,
                    )),
              ),
              Container(
                height: MediaQuery
                    .of(context)
                    .size
                    .height * 1 / 7,
                width: MediaQuery
                    .of(context)
                    .size
                    .width * 1 / 3,
                child: InkWell(

                  splashColor: Colors.greenAccent,

                  onTap: () async {

                    var results = await classifyModel(widget.image);
                    var inputImage = widget.image;




                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                          displayResults(inputImage, results)),
                    );
                  },
                  child: Icon(
                    CupertinoIcons.check_mark,
                    size: 48,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
