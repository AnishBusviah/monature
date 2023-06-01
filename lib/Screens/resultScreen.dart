import 'dart:io';


import 'package:flutter/material.dart';

class displayResults extends StatelessWidget {
  displayResults(this.inputImage, this.results, {Key? key}) : super(key: key);

  final File inputImage;
  var results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Results"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Center(
              child: Container(
                  width: 3 / 4 * MediaQuery.of(context).size.width,
                  height: 3 / 5 * MediaQuery.of(context).size.height,
                  child: Image.file(inputImage)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Label: ${results[0]['label'].replaceAll(RegExp('[0-9]'), "")}",
                    style: _textStyle(),
                  ),
                  Text(
                    "Confidence: ${((results[0]['confidence']) * 100).toStringAsPrecision(3)}%",
                    style: _textStyle(),
                  ),
                  Text(
                    "Index: ${results[0]['index'].toString()}",
                    style: _textStyle(),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

TextStyle _textStyle() {
  return const TextStyle(fontSize: 20, fontWeight: FontWeight.bold);
}
