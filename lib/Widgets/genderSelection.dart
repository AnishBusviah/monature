import 'package:flutter/material.dart';

List<String> Genders = ["Male", "Female", "Others"];

class Genderpicker extends StatefulWidget {
  const Genderpicker({Key? key}) : super(key: key);

  @override
  State<Genderpicker> createState() => _GenderpickerState();
}

class _GenderpickerState extends State<Genderpicker> {
  String _selectedGender = Genders[2];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 34 / 40 * MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [RadioSelector(0), RadioSelector(1), RadioSelector(2)],
      ),
    );
  }

  Container RadioSelector(int index) {
    return Container(
      width: 111,
      height: 1 / 22 * MediaQuery.of(context).size.height,
      padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            border: Border.all( color: Color.fromRGBO(102, 102, 102, 0.7))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              Genders[index],
              style: TextStyle(
                  color: Color.fromRGBO(102, 102, 102, 1), fontSize: 17),
            ),
            Radio<List<String>>(
              value: [Genders[index]],
              groupValue: [Genders[2]],
              onChanged: (value) {
                setState(() {
                  _selectedGender = value![0];
                  //print(_selectedGender);
                });
              },
            )
          ],
        ));
  }
}
