import 'package:flutter/material.dart';
import 'package:pcgo/provider/theme_provider.dart';
import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/custom_themes.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:provider/provider.dart';

class CustomElevatedButton extends StatelessWidget {
  final Function onTap;
  final String buttonText;
  final Color backgroundColor;
  final Color textColor;
  final Widget child;

  CustomElevatedButton({
    @required this.onTap,
    @required this.buttonText,
    this.backgroundColor = const Color(0XFF2434D7),
    this.textColor,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            textStyle: const TextStyle(
              fontSize: 20,
            ),
            padding: const EdgeInsets.all(8.0),
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
                    ),
                  ),
          ),
        )),
      ],
    );
  }
}
