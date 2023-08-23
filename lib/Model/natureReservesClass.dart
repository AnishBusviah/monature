import 'package:flutter/material.dart';

class NatureReservesClass{
  late String name;
  late  String description;
  // late String specialty;
  late String location;
  // late String emailAddress;
  late String telNo;
  late String imageUrl;

  NatureReservesClass({
    required this.name,
    required this.description,
    // required this.specialty,
    required this.location,
    // required this.emailAddress,
    required this.telNo,
    required this.imageUrl,
  });

  factory NatureReservesClass.fromJson(Map<String, dynamic> json) {
    return NatureReservesClass(
      name: json["Name"],
      location: json["Location"],
      description: json["Description"],
      // specialty: json["French Name"],

      // emailAddress: json["Email"],
      telNo: json["Contact Information"],
      imageUrl: json["Image"],

    );
  }
}