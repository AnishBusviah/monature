import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

  }





  Future addUserDetails(String firstName, String lastName, String birthYear, String birthMonth, String birthDay, String gender, String email) async {


    if  (birthDay.length != 2){
      birthDay = '0${birthDay}';
    }


    if  (birthMonth.length != 2){
      birthMonth = '0${birthMonth}';
    }

    DateTime birthdayDate = DateTime.parse('${birthYear}-${birthMonth}-${birthDay}');

    await FirebaseFirestore.instance.collection('users').add({
      'first name': firstName,
      'last name': lastName,
      'birthday': birthdayDate,
      'gender': gender,
      'email': email,
    });
  }



  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
