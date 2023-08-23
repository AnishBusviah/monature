import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:monature/Model/natureReservesClass.dart';
import 'package:monature/Screens/natureReserves.dart';

class NatureReserveList extends StatefulWidget {
  const NatureReserveList({Key? key}) : super(key: key);

  @override
  State<NatureReserveList> createState() => _NatureReserveListState();
}

class _NatureReserveListState extends State<NatureReserveList> {
  late String reserveName;
  late String reserveLocation;
  late String reserveDescription;
  late String reservePhone;
  late String reserveEmail;
  late String reserveImage;

  List<NatureReservesClass> reservesList = [];

  readReservesJson() async {
    final natureReservesJson =
    await rootBundle.loadString('assets/Nature Reserve.json');
    final decodedData = await jsonDecode(natureReservesJson);
    final natureReservesDataList = decodedData["Nature Reserve"];

    // int count = 0;

    for (var natureReserve in natureReservesDataList) {
      NatureReservesClass natureReserveData =
      NatureReservesClass.fromJson(natureReserve);

      setState(() {
        reservesList.add(natureReserveData);
      });

      // count++;
    }
  }

  @override
  void initState() {
    readReservesJson();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Nature Reserves"),
      ),
      body: ListView.builder(
          itemCount: reservesList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(top: 30),
              child: ListTile(onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ItemPage(name: reservesList[index].name,
                        description: reservesList[index].description,
                        location: reservesList[index].location,
                        telNo: reservesList[index].telNo,
                        imageUrl: reservesList[index].imageUrl,)));
              },
                  leading: SizedBox(
                      width: 100,
                      height: 100,
                      child: FittedBox(fit: BoxFit.fill,
                          child: Image.network(reservesList[index].imageUrl))),
                  title: Text(reservesList[index].name)),
            );
          }),
    );
  }
}
