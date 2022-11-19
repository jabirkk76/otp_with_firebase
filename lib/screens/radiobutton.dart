import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  String? a; //no radio button will be selected

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: RadioListTile(
              title: Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        Image.asset('assets/Vector (4).jpg'),
                        Padding(
                          padding: const EdgeInsets.only(left: 5, top: 10),
                          child: Image.asset('assets/Vector (5).jpg'),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Shipper',
                            style: TextStyle(fontSize: 20),
                          ),
                          Text(
                            'Lore ipsum dolarsit amet,',
                            style: TextStyle(color: Colors.grey),
                          ),
                          Text(
                            'consecteturadipiscing',
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              value: "female",
              groupValue: a,
              onChanged: (value) {
                setState(() {
                  a = value.toString();
                });
              },
            ),
          ),
          height: 98,
          width: 333,
          decoration: BoxDecoration(border: Border.all()),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.only(top: 15),
            child: RadioListTile(
              title: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 2, bottom: 15),
                    child: Image.asset('assets/Vector (6).jpg'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Transporter',
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          'Lore ipsum dolarsit amet,',
                          style: TextStyle(color: Colors.grey),
                        ),
                        Text(
                          'consecteturadipiscing',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
              value: "male",
              groupValue: a,
              onChanged: (value) {
                setState(() {
                  a = value.toString();
                });
              },
            ),
          ),
          height: 98,
          width: 333,
          decoration: BoxDecoration(border: Border.all()),
        ),
      ],
    );
  }
}
