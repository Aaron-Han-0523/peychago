import 'package:flutter/material.dart';

class CustomCarNumberTextField extends StatefulWidget {
  final TextEditingController controller;
  final Function function;

  CustomCarNumberTextField(this.controller, {this.function});

  @override
  State<CustomCarNumberTextField> createState() =>
      _CustomCarNumberTextFieldState();
}

class _CustomCarNumberTextFieldState extends State<CustomCarNumberTextField> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20.0,
      shadowColor: Color(0XFF2434D7),
      borderRadius: BorderRadius.all(Radius.circular(8.0)),
      child: Stack(
          // elevation: 20.0,
          // shadowColor: Color(0XFF2434D7),
          children: [
            Container(
              alignment: Alignment.centerRight,
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.black87,
                ),
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
                color: Colors.white,
              ),
              child: Container(
                // width: 10,
                height: 42,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(
                      Icons.circle,
                      color: Colors.grey,
                      size: 10,
                    ),
                    Expanded(
                      child: TextFormField(
                        controller: widget.controller,
                        obscureText: false,
                        autofocus: false,
                        style: TextStyle(fontSize: 30.0),
                        textAlign: TextAlign.center,
                        maxLength: 10,
                        decoration: InputDecoration(
                          // icon: new Icon(Icons.circle, color: Colors.grey),
                          hintText: '100가1234',
                          fillColor: Colors.white,
                          filled: true,
                          counterText: '',
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          contentPadding:
                              EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0),
                            borderSide:
                                BorderSide(color: Colors.white, width: 3.0),
                          ),
                        ),
                        onChanged: (value) {
                          widget.function(value.length > 6);
                        },
                      ),
                    ),
                    Container(
                      child: Icon(
                        Icons.circle,
                        color: Colors.grey,
                        size: 10,
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
