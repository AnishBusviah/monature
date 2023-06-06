import 'package:flutter/material.dart';
import 'package:monature/Screens/loginScreen.dart';
import 'package:monature/Screens/profile.dart';
import 'package:monature/Widgets/backgroundLinearGradient.dart';
import 'package:monature/Widgets/datepicker_dropdown.dart';
import 'package:monature/Widgets/elevatedButtonStyle.dart';
import 'package:monature/Widgets/genderSelection.dart';
import 'package:monature/Widgets/textField.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

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

  bool _isChecked = false;

  //Firebase Register
  String? errorMessage = '';
  bool isLogin = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConfirmPassword =
      TextEditingController();
  final TextEditingController _controllerFirstName = TextEditingController();
  final TextEditingController _controllerLastName = TextEditingController();
  String? _controllerGender;
  late String _controllerBirthMonth;
  late String _controllerBirthDay;
  late String _controllerBirthYear;


  Future<void> createUserWithEmailAndPassword() async {
    try {
      // create User
      // add validation e.g if(passwordConfirmed())
      await Auth().createUserWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );

      // add User Details
      await Auth().addUserDetails(
          _controllerFirstName.text,
          _controllerLastName.text,
          _controllerBirthYear,
          _controllerBirthMonth,
          _controllerBirthDay,
          _controllerGender!,
          _controllerEmail.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

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
                          controller: _controllerFirstName,
                          displayText: "First Name",
                          textFieldWidth: textFieldWidthHalf,
                          textFieldHeight: textFieldHeight,
                        ),
                        InputTextField(
                          controller: _controllerLastName,
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
                        controller: _controllerEmail,
                        displayText: "Email Address",
                        textFieldWidth: textFieldWidthFull,
                        textFieldHeight: textFieldHeight),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: InputTextField(
                        controller: _controllerPassword,
                        displayText: "Password",
                        textFieldWidth: textFieldWidthFull,
                        textFieldHeight: textFieldHeight),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: paddingTop),
                    child: InputTextField(
                        controller: _controllerConfirmPassword,
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
                        onChangedDay: (value) {
                          print('onChangedDay: $value');
                          _controllerBirthDay = value!;
                          print(_controllerBirthDay);
                        },
                        onChangedMonth: (value) {
                          print('onChangedMonth: $value');
                          _controllerBirthMonth = value!;
                          print(_controllerBirthMonth);

                        },
                        onChangedYear: (value) {
                          print('onChangedYear: $value');
                          _controllerBirthYear = value!;
                          print(_controllerBirthYear);
                        },
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
                      Genderpicker(onChangedGender: (value) {
                        setState(() {
                          _controllerGender = value;
                        });
                      }),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Container(
                      //color: Colors.redAccent,
                      width: textFieldWidthFull *
                          MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                              width: 310,
                              child: Text(
                                "By clicking Sign Up, you agree to our Terms, Privacy Policy and Cookies Policy. You may receive Email Notifications from us and can opt out any time.",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                ),
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
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 7),
                    child: SizedBox(
                        width: 200,
                        child: ElevatedButton(
                            onPressed: () {
                              createUserWithEmailAndPassword();
                              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                              //print(_controllerBirthYear+_controllerBirthMonth+_controllerBirthDay);
                            },
                            style: elevatedButtonStyle(),
                            child: const Text(
                              "Sign Up",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ))),
                  )
                ],
              ),
            ),
          )),
    );
  }
}
