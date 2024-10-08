import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:peaceful_pulse_admin/bin/first_page_ui.dart';

class AuthServicesPhone {
  Future<void> sendCode(context, phoneNumber) async {
    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
          phoneNumber: '+91 $phoneNumber',
          verificationCompleted: (PhoneAuthCredential credential) {},
          verificationFailed: (FirebaseAuthException e) {
            print('An error occured: ${e.code}');
          },
          codeSent: (String vid, int? token) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstTestPage(),
              ),
            );
          },
          codeAutoRetrievalTimeout: (vid) {});
    } on FirebaseAuthException catch (e) {
      print('Error Occured : ${e.code}');
    } catch (e) {
      print(
        'Error Occured : ${e.toString()}',
      );
    }
  }
}
