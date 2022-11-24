import 'package:flutter/material.dart';

class RatingBar extends StatefulWidget {
  final double rating;
  final double size;
  final TextEditingController controller;
  final Function callback;
  final bool isCreateScreen;

  RatingBar({@required this.rating, this.size = 18, this.callback, this.controller, this.isCreateScreen = true});

  @override
  State<RatingBar> createState() => _RatingBarState();
}

class _RatingBarState extends State<RatingBar> {
  int realNumber = 0;
  int partNumber = 0;

  @override
  void initState() {
    realNumber = widget.rating.floor();
    partNumber = ((widget.rating - realNumber) * 10).ceil();
    super.initState();
  }

  void rebuild(int i) {
    if(widget.isCreateScreen) {
      setState(() {
        realNumber = i;
        widget.controller.text = i.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> _starList = [];

    for (int i = 1; i <= 5; i++) {
      if (i == 1) {
        _starList.add(
          InkWell(
            child: realNumber == 0
                ? Icon(Icons.star_border,
                    color: Color(0XFF2434D7), size: widget.size)
                : Icon(Icons.star, color: Color(0XFF2434D7), size: widget.size),
            onTap: () {
              // if(realNumber == 1) realNumber = 0;
              realNumber = realNumber == 1 ? 0 : i;
              rebuild(realNumber);
              // widget.callback(realNumber);
            },
          ),
        );
      } else if (i < realNumber) {
        _starList.add(
          InkWell(
            child:
                Icon(Icons.star, color: Color(0XFF2434D7), size: widget.size),
            onTap: () {
              realNumber = realNumber == i ? 0 : i;
              rebuild(realNumber);
              // widget.callback(realNumber);
            },
          ),
        );
      } else if (i == realNumber) {
        _starList.add(
          InkWell(
            child: SizedBox(
              height: widget.size,
              width: widget.size,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Icon(Icons.star, color: Color(0XFF2434D7), size: widget.size),
                  ClipRect(
                    clipper: _Clipper(part: partNumber),
                    child: Icon(Icons.star_border,
                        color: Color(0XFF2434D7), size: widget.size),
                  )
                ],
              ),
            ),
            onTap: () {
              realNumber = realNumber == i ? 0 : i;
              rebuild(realNumber);
              // widget.callback(realNumber);
            },
          ),
        );
      } else {
        _starList.add(
          InkWell(
            child: Icon(Icons.star_border,
                color: Color(0XFF2434D7), size: widget.size),
            onTap: () {
              realNumber = realNumber == i ? 0 : i;
              rebuild(realNumber);
              // widget.callback(realNumber);
            },
          ),
        );
      }
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: _starList,
    );
  }
}

class _Clipper extends CustomClipper<Rect> {
  final int part;

  _Clipper({@required this.part});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(
      (size.width / 10) * part,
      0.0,
      size.width,
      size.height,
    );
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) => true;
}
