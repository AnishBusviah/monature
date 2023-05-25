import 'dart:io';

import 'package:tflite/tflite.dart';

loadModel() async {
  await Tflite.loadModel(
    model: 'assets/model_unquant.tflite',
    labels: 'assets/labels.txt',
  );
}

Future<dynamic> classifyModel(File image) async {
  var results = await Tflite.runModelOnImage(
    path: image.path,
    numResults: 2,
    threshold: 0.5,
    imageMean: 127.5,
    imageStd: 127.5,
  );


  return results;
}
