import 'package:flutter/material.dart';

import 'package:pcgo/utill/dimensions.dart';
import 'package:pcgo/utill/images.dart';

import '../../../../localization/language_constrants.dart';
import '../../chat/chat_screen.dart';

class FooterPage extends StatefulWidget {
  @override
  State<FooterPage> createState() => _FooterPageState();
}

class _FooterPageState extends State<FooterPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      width: MediaQuery.of(context).size.width + 100,
      decoration: BoxDecoration(color: Colors.black12),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  Images.main_logo,
                  height: 25,
                  color: Colors.black38,
                ),
                Container(
                  alignment: Alignment.centerRight,
                  margin: const EdgeInsets.all(4.0),
                  padding: const EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Color(0XFF2434D7),
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(14.0)),
                    color: Colors.white,
                  ),
                  child: InkWell(
                    onTap: () => {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => ChatPage()))
                    },
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          ImageIcon(
                            AssetImage(
                              Images.footer_chat,
                            ),
                            color: Color(0XFF2434D7),
                            size: 16.0,
                          ),
                          Text(
                            "${getTranslated('1AND1_CHATTING', context)}",
                            style: TextStyle(
                              fontSize: 13,
                              color: Color(0XFF2434D7),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            const Divider(
              height: 5,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.white,
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT1', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT2', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT3', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT4', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT5', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT6', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT7', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
            Text(
              "${getTranslated('FOOTER_TEXT8', context)}",
              style: TextStyle(color: Colors.black38
                  // fontSize: 20,
                  ),
            ),
            SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_EXTRA_SMALL),
          ],
        ),
      ),
    );
  }
}
