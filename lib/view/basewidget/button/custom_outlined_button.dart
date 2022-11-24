import 'package:flutter/material.dart';
import 'package:pcgo/provider/theme_provider.dart';
import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/custom_themes.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:provider/provider.dart';

class CustomOutlinedButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final Widget child;

  CustomOutlinedButton({
    @required this.onTap,
    @required this.buttonText,
    this.backgroundColor = Colors.white,
    this.child,
    this.borderColor = const Color(0XFF2434D7),
    this.textColor = const Color(0XFF2434D7),
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton(
            style: ElevatedButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 20,
                color: textColor,
              ),
              padding: const EdgeInsets.all(8.0),
              side: BorderSide(
                width: 1.0,
                color: borderColor,
              ),
              backgroundColor: backgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
              ),
            ),
            onPressed: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: child != null
                  ? child
                  : Text(
                      buttonText,
                      style: TextStyle(
                        fontSize: 18,
                        color: textColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
            ),
          ),
        ),
      ],
    );
  }
}
