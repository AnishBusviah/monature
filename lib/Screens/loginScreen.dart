import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:get/get.dart';
import 'package:monature/Screens/profile.dart';
import 'package:monature/Screens/registerScreen.dart';
import 'package:monature/Widgets/elevatedButtonStyle.dart';
import 'package:monature/Widgets/textField.dart';
import '../Widgets/backgroundLinearGradient.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLogin = false;

  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await Auth().signInWithEmailAndPassword(
        email: _controllerEmail.text,
        password: _controllerPassword.text,
      );
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: Auth().authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData){
          return Profile();
        }else{
        return Center(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(gradient: backgroundLinearGradient()),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100),
                  child: Container(
                    child: Column(
                      children: [
                        Image.asset(
                          'assets/logo.png',
                          scale: 2,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(
                            "Mo Natur",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Container(
                    width: 4 / 5 * MediaQuery.of(context).size.width,
                    height: 0.4 * MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 30),
                          child: InputTextField(
                            controller: _controllerEmail,
                              displayText: "Email Address",
                              textFieldWidth: 5 / 7,
                              textFieldHeight: 1 / 15),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: InputTextField(
                            controller: _controllerPassword,
                            displayText: "Password",
                            textFieldWidth: 5 / 7,
                            textFieldHeight: 1 / 15,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              SizedBox(
                                  width: 130,
                                  height: 40,
                                  child: ElevatedButton(
                                    onPressed: () {},
                                    style: elevatedButtonStyle(),
                                    child: const Text(
                                      "Log In",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  )),
                              SizedBox(
                                  width: 150,
                                  height: 40,
                                  child: SignInButton(
                                    Buttons.Google,
                                    text: "     Sign in \n with Google",
                                    onPressed: () {},
                                  ))
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35,
                          child: TextButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              overlayColor:
                                  MaterialStateProperty.all(Colors.transparent),
                            ),
                            child: const Text("Forgot Password?"),
                          ),
                        ),
                        const SizedBox(
                            width: 300,
                            child: Divider(
                              color: Color.fromRGBO(158, 158, 158, 1),
                              height: 10,
                              thickness: 1,
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SizedBox(
                            width: 220,
                            height: 45,
                            child: ElevatedButton(
                              onPressed: () {
                                Get.to(() => RegisterScreen(),
                                    transition: Transition.rightToLeft,
                                    duration: Duration(milliseconds: 750));

                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => RegisterScreen()));
                              },
                              style: elevatedButtonStyle(),
                              child: const Text(
                                "Create new account",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }}
    );
  }
}
