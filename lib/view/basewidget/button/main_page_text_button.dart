import 'package:flutter/material.dart';
import 'package:pcgo/provider/theme_provider.dart';
import 'package:pcgo/utill/color_resources.dart';
import 'package:pcgo/utill/custom_themes.dart';
import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';
import 'package:provider/provider.dart';

class MainPageTextButton extends StatelessWidget {
  final Function onTap;
  final String buttonImage;
  final String detailButtonText;
  MainPageTextButton({@required this.onTap, @required this.buttonImage, @required this.detailButtonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        alignment: Alignment.centerLeft,
        margin: const EdgeInsets.fromLTRB(24.0, 6.0, 24.0, 6.0),
        // padding: const EdgeInsets.all(16.0),
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Color(0XFF2434D7),
          ),
          borderRadius:
          BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              buttonImage,
              height: 30,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Text(
              // "지금 바로 폐차견적을 확인하세요!",
              detailButtonText,
              style: TextStyle(
                fontSize: 20,
                color: Colors.black54,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      onTap: onTap,
      // onTap: () {
      //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgreePage()));
      // },
    );
  }
}
