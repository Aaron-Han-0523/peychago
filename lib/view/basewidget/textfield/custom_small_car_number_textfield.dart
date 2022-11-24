import 'package:flutter/material.dart';

class CustomSmallCarNumberTextField extends StatelessWidget {
  final String carNumber;

  CustomSmallCarNumberTextField(this.carNumber);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: Color(0XFF2434D7),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Stack(children: [
        Container(
          alignment: Alignment.centerRight,
          // margin: const EdgeInsets.all(4.0),
          padding: const EdgeInsets.all(8.0),
          width: 150,
          decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
              // color: Colors.black12,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white,
                  Colors.grey,
                ],
              )),
          child: Container(
            // width: 10,
            height: 30,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.circle_outlined,
                  color: Colors.black87,
                  size: 7,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextFormField(
                      obscureText: true,
                      autofocus: false,
                      // readOnly: true,
                      enabled: false,
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                      decoration: InputDecoration(
                        // icon: new Icon(Icons.circle, color: Colors.grey),
                        hintText: '$carNumber',
                        // fillColor: Colors.black12,
                        filled: true,
                        contentPadding:
                            EdgeInsets.fromLTRB(5.0, 30.0, 5.0, 0.0),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.circle_outlined,
                    color: Colors.black87,
                    size: 7,
                  ),
                  width: 10,
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
