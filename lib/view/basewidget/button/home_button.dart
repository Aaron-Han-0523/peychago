import 'package:flutter/material.dart';
import 'package:pcgo/view/screen/home/home_screens.dart';

class HomeButton extends StatelessWidget {
  final Color color;

  HomeButton(this.color);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (_) => HomePage()), (route) => false);
      },
      // icon: Icon(Icons.arrow_back_ios, color: color, size: 16),
      icon: Icon(Icons.home_outlined, color: color, size: 32,),
    );
  }
}
