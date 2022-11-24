import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomSmallRadioButton extends StatelessWidget {
  final bool _value;
  final String text;

  CustomSmallRadioButton(this._value, this.text);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: _value
                ? SvgPicture.asset(
                    "assets/icons/radio_button_checked_FILL0_wght400_GRAD0_opsz48.svg",
                    width: 16,
                    color: Color(0XFF2434D7),
                  )
                : SvgPicture.asset(
                    "assets/icons/radio_button_unchecked_FILL0_wght400_GRAD0_opsz48.svg",
                    width: 16,
                    color: Color(0XFF2434D7),
                  )),
        Expanded(
          // width: MediaQuery.of(context).size.width * 0.5,
          child: Text(
            text,
            maxLines: 4,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ],
    );
  }
}
