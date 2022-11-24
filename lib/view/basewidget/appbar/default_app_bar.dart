import 'package:flutter/material.dart';

import '../button/home_button.dart';

class DefaultAppBar extends StatelessWidget {
  final String titleText;

  DefaultAppBar(this.titleText);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        title: Text(
          titleText,
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(color: Colors.black),
        actions: [HomeButton(Colors.black)],
        backgroundColor: Colors.white
    );
  }

  Widget getAppbar() {
    return AppBar(
        title: Text(
          titleText,
          style: TextStyle(color: Colors.black),
        ),
        leading: BackButton(color: Colors.black),
        actions: [HomeButton(Colors.black)],
        backgroundColor: Colors.white
    );
  }
}
