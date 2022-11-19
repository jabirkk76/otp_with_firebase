import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:phoneotptask/screens/mobilenumber.dart';
import 'package:phoneotptask/widget/drop.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20, right: 15),
                    child: Image.asset('assets/Vector (3).jpg'),
                  ),
                  height: 42,
                  width: 42,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/Vector (2).jpg')),
                      border: Border.all(),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      )),
                ),
                SizedBox(
                  height: 34,
                ),
                Text(
                  'Please select your Language',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  'You can change the language',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                Text(
                  'at anytime.',
                  style: TextStyle(fontSize: 17, color: Colors.grey),
                ),
                SizedBox(
                  height: 24,
                ),
                Drop(),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Container(
                      height: 48,
                      width: 216,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 52, 67, 153)),
                          onPressed: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (ctx) {
                              return Mobilenumber();
                            }));
                          },
                          child: Text(
                            'NEXT',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
