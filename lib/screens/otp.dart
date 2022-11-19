// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:phoneotptask/screens/profileselction.dart';
import 'package:phoneotptask/screens/radiobutton.dart';

class OneTimePassword extends StatefulWidget {
  const OneTimePassword({super.key, required this.codeFromFirebase});
  final String codeFromFirebase;

  @override
  State<OneTimePassword> createState() => _OneTimePasswordState();
}

class _OneTimePasswordState extends State<OneTimePassword> {
  @override
  Widget build(BuildContext context) {
    log('build called');
    String myOtp = '';
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 330),
                child:
                    IconButton(onPressed: () {}, icon: const Icon(Icons.close)),
              ),
              const SizedBox(
                height: 100,
              ),
              Center(
                child: Column(
                  children: [
                    const Text(
                      'Verify Phone',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    const Text(
                      'Code is sent',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    OtpTextField(
                      numberOfFields: 6,
                      borderColor: const Color(0xFF512DA8),
                      //set to true to show as box or false to show as dash
                      showFieldAsBox: true,
                      //runs when a code is typed in
                      onCodeChanged: (String code) {
                        setState(() {
                          myOtp = code;
                          log("set $myOtp");
                        });
                      },
                      //runs when every textfield is filled
                      onSubmit: (String verificationCode) {}, // end onSubmit
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Don\'t receive the code ? ',
                            style: TextStyle(fontSize: 17, color: Colors.grey),
                          ),
                          const Text(
                            'Request again',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Color.fromARGB(255, 87, 87, 87)),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20, right: 7),
                      child: Container(
                          height: 48,
                          width: 227,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 52, 67, 153)),
                              onPressed: () async {
                                log("this is my otp: $myOtp");
                                if (myOtp.length >= 6) {
                                  await FirebaseAuth.instance
                                      .signInWithCredential(
                                          PhoneAuthProvider.credential(
                                              verificationId:
                                                  widget.codeFromFirebase,
                                              smsCode: myOtp))
                                      .then((value) {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(builder: (ctx) {
                                      return Profile();
                                    }));
                                  }).catchError((e) {
                                    log(e.toString());
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(const SnackBar(
                                      content: Text('Invalid otp'),
                                      backgroundColor: Colors.red,
                                    ));
                                  });
                                }
                              },
                              child: const Text(
                                'VERIFY AND CONTINUE',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ))),
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
