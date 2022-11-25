// ignore_for_file: use_build_context_synchronously

import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phoneotptask/screens/country.dart';

class Mobilenumber extends StatefulWidget {
  const Mobilenumber({super.key});

  @override
  State<Mobilenumber> createState() => _MobilenumberState();
}

class _MobilenumberState extends State<Mobilenumber> {
  TextEditingController phoneController = TextEditingController();
  var code = '';
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                    CountryWithPhone(
                      phoneController: phoneController,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Container(
                          height: 48,
                          width: 216,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor:
                                      const Color.fromARGB(255, 52, 67, 153)),
                              onPressed: () async {
                                await FirebaseAuth.instance.verifyPhoneNumber(
                                    phoneNumber: "+91${phoneController.text}",
                                    verificationCompleted:
                                        ((PhoneAuthCredential credential) {}),
                                    verificationFailed:
                                        (FirebaseAuthException e) {
                                      log(e.message!);
                                    },
                                    codeSent: (String verificationId,
                                        int? resendToken) {
                                      setState(() {
                                        code = verificationId;
                                      });
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Otp sent'),
                                        backgroundColor: Colors.green,
                                      ));
                                    },
                                    codeAutoRetrievalTimeout:
                                        (String verificationId) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(const SnackBar(
                                        content: Text('Time out'),
                                        backgroundColor: Colors.red,
                                      ));
                                    });
                              },
                              child: const Text(
                                'CONTINUE',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.bold),
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
