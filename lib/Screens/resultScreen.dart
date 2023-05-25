import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';

class displayResults extends StatelessWidget {
  displayResults(this.inputImage, this.results, {Key? key}) : super(key: key);

  final File inputImage;
  var results;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Results"),),
      body: Center(
        child: Container(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Image.file(inputImage),
              ),
              Container(
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
                      "Confidence: ${results[0]['confidence'].toString()}",
                      style: _textStyle(),
                    ),
                    Text(
                      "Index: ${results[0]['index'].toString()}",
                      style: _textStyle(),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

TextStyle _textStyle() {
  return const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold
  );
}
