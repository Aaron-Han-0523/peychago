import 'package:flutter/material.dart';

class CustomTextarea extends StatelessWidget {
  final bool isBorder;
  final bool enabled;
  final TextEditingController textEditingController;

  CustomTextarea({
    this.isBorder = true,
    this.textEditingController, this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: new EdgeInsets.all(4.0),
      child: new ConstrainedBox(
        constraints: new BoxConstraints(
          maxHeight: 155.0,
        ),
        child: Container(
          decoration: BoxDecoration(
            border: isBorder
                ? Border.all(
                    width: 1,
                    color: Color(0xff666666),
                  )
                : null,
            // color: Color(0xffdddddd),
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: new SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: false,

            // here's the actual text box
            child: Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 0.0, 12.0, 12.0),
              child: TextField(
                enabled: enabled,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                minLines: 10,
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontSize: 17),
                  hintText: '자세한 후기는 다른 고객의 이용에 도움이 되며 오해의 소재가 있는 내용을 작성 시 검토 후 비공개 조치 할 수 있습니다.',
                  hintMaxLines: 5,
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.all(10),
                ),                // readOnly: true,
                style: TextStyle(
                  color: Colors.grey,
                ),
                controller: textEditingController,
              ),
            ),
            // ends the actual text box
          ),
        ),
      ),
    );
  }
}
