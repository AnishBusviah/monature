import 'package:flutter/material.dart';
import 'package:monature/Widgets/backgroundLinearGradient.dart';
import 'package:monature/Widgets/datepicker_dropdown.dart';
import 'package:monature/Widgets/elevatedButtonStyle.dart';
import 'package:monature/Widgets/genderSelection.dart';
import 'package:monature/Widgets/textField.dart';

List<String> months = <String>[
  'Jan',
  'Feb',
  'Mar',
  'Apr',
  'May',
  'Jun',
  'Jul',
  'Aug',
  'Sep',
  'Oct',
  'Nov',
  'Dec'
];

List<String> date = <String>[(01 - 31).toString()];

List<String> year = <String>[(1999 - 2023).toString()];

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final double textFieldHeight = 1 / 22;
  final double textFieldWidthFull = 34 / 40;
  final double textFieldWidthHalf = 2 / 5;
  final double textFieldWidthThird = 1;

  final double paddingTop = 15;

  String selectedMonth = months.first;

  String selectedDate = date.first;

  String selectedYear = year.first;

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(gradient: backgroundLinearGradient()),
          child: Center(
            child: Container(
              width: 8 / 9 * MediaQuery.of(context).size.width,
              height: 6 / 9 * MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.close_rounded,
                            size: 40,
                            color: Color.fromRGBO(96, 103, 113, 1),
                          )),
                    ],
                  ),
                  const Text(
                    "Sign Up",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InputTextField(
                          displayText: "First Name",
                          textFieldWidth: textFieldWidthHalf,
                          textFieldHeight: textFieldHeight,
                        ),
                        InputTextField(
                          displayText: "Last Name",
                          textFieldWidth: textFieldWidthHalf,
                          textFieldHeight: textFieldHeight,
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: InputTextField(
                        displayText: "Email Address",
                        textFieldWidth: textFieldWidthFull,
                        textFieldHeight: textFieldHeight),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: InputTextField(
                        displayText: "Password",
                        textFieldWidth: textFieldWidthFull,
                        textFieldHeight: textFieldHeight),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: InputTextField(
                        displayText: "Confirm Password",
                        textFieldWidth: textFieldWidthFull,
                        textFieldHeight: textFieldHeight),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: SizedBox(
                      width: textFieldWidthFull *
                          MediaQuery.of(context).size.width,
                      height: (2 / 22) * MediaQuery.of(context).size.height,
                      child: DropdownDatePicker(
                        isExpanded: false,
                        fieldHeight: textFieldHeight,

                        label: "Birthday",
                        labelStyle: const TextStyle(
                            color: Color.fromRGBO(102, 102, 102, 1),
                            fontSize: 16),
                        monthFlex: 1,
                        dayFlex: 1,
                        yearFlex: 1,
                        locale: "en_abbrev",
                        inputDecoration: InputDecoration(
                            contentPadding:
                                const EdgeInsets.only(top: 5, left: 0),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 1.0),
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        // optional
                        isDropdownHideUnderline: true,
                        // optional
                        isFormValidator: true,
                        // optional
                        startYear: 1900,
                        // optional
                        endYear: 2020,
                        // optional
                        width: 10,
                        // optional
                        // selectedDay: 14, // optional
                        //selectedMonth: 10, // optional
                        //selectedYear: 1993, // optional
                        onChangedDay: (value) => print('onChangedDay: $value'),
                        onChangedMonth: (value) =>
                            print('onChangedMonth: $value'),
                        onChangedYear: (value) =>
                            print('onChangedYear: $value'),
                        boxDecoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)),
                        // border: Border.all(color: Colors.grey, width: 1.0)), // optional
                        // showDay: false,// optional
                        // dayFlex: 2,// optional
                        // locale: "zh_CN",// optional
                        hintDay: 'Day',
                        // optional
                        hintMonth: 'Month',
                        // optional
                        hintYear: 'Year',
                        // optional
                        hintTextStyle: const TextStyle(
                            color:
                                Color.fromRGBO(102, 102, 102, 1)), // optional
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: const [
                          Padding(
                            padding: EdgeInsets.only(left: 10, bottom: 5),
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                  fontSize: 16),
                            ),
                          )
                        ],
                      ),
                      const Genderpicker(),
                    ],
                  ),

                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      //color: Colors.redAccent,
                      width: textFieldWidthFull * MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children:  [
                          const SizedBox(
                              width: 310,
                              child: Text(
                                "By clicking Sign Up, you agree to our Terms, Privacy Policy and Cookies Policy. You may receive Email Notifications from us and can opt out any time.",
                                style: TextStyle(fontSize: 12, color: Color.fromRGBO(102, 102, 102, 1),),
                              )),
                          SizedBox(
                            width: 30,
                            height: 20,
                            child: Checkbox(
                                value: _isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    _isChecked = value!;
                                  });
                                }),
                          )
                        ],
                      ),
                    ),
                  ), Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: SizedBox(width: 200, child: ElevatedButton(onPressed: (){}, style: elevatedButtonStyle(), child: const Text("Sign Up", style: TextStyle(fontWeight: FontWeight.bold),))),
                  )],
              ),
            ),
          )),
    );
  }
}
