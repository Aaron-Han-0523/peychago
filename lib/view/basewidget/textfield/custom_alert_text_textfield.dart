import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pcgo/utill/custom_themes.dart';

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}

class CustomAlertTextTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType textInputType;
  final int maxLine;
  final FocusNode focusNode;
  final FocusNode nextNode;
  final TextInputAction textInputAction;
  final bool isPhoneNumber;
  final bool isValidator;
  final String validatorMessage;
  final Color fillColor;
  final TextCapitalization capitalization;
  final bool isBorder;
  Color borderColor;
  TextAlign textAlign;
  bool enabled;
  bool isPassword;

  CustomAlertTextTextField({
    this.controller,
    this.hintText,
    this.textInputType,
    this.maxLine,
    this.focusNode,
    this.nextNode,
    this.textInputAction,
    this.isPhoneNumber = false,
    this.isValidator = false,
    this.validatorMessage,
    this.capitalization = TextCapitalization.none,
    this.fillColor,
    this.isBorder = false,
    this.borderColor = Colors.grey,
    this.textAlign = TextAlign.start,
    this.enabled = true,
    this.isPassword = false,
  });

  @override
  Widget build(context) {
    return Container(
      alignment: Alignment.centerRight,
      // margin: const EdgeInsets.all(4.0),
      padding: const EdgeInsets.all(8.0),
      // width: 150,
      decoration: BoxDecoration(
        border: isBorder ? Border.all(width: 1, color: borderColor) : null,
        color: Colors.white,
        borderRadius: isPhoneNumber
            ? BorderRadius.only(
                topRight: Radius.circular(6), bottomRight: Radius.circular(6))
            : BorderRadius.all(Radius.circular(12.0)),
        // boxShadow: [
        //   BoxShadow(color: Colors.grey.withOpacity(0.1), spreadRadius: 1, blurRadius: 3, offset: Offset(0, 1)) // changes position of shadow
        // ],
      ),
      child: Container(
        height: 22,
        margin: EdgeInsets.all(4.0),
        child: TextFormField(
          obscureText: false,
          autofocus: false,
          // readOnly: true,
          enabled: enabled,
          style: TextStyle(fontSize: 18.0),
          textAlign: textAlign,
          controller: controller,
          maxLines: maxLine ?? 1,
          textCapitalization: capitalization,
          maxLength: isPhoneNumber ? 15 : isPassword ? 4 : null,
          focusNode: focusNode,
          keyboardType: textInputType ?? TextInputType.text,
          //keyboardType: TextInputType.number,
          initialValue: null,
          textInputAction: textInputAction ?? TextInputAction.next,
          onFieldSubmitted: (v) {
            FocusScope.of(context).requestFocus(nextNode);
          },
          //autovalidate: true,
          inputFormatters: [
            isPhoneNumber
                ? FilteringTextInputFormatter.digitsOnly
                : FilteringTextInputFormatter.singleLineFormatter
          ],
          validator: (input) {
            if (input.isEmpty) {
              if (isValidator) {
                return validatorMessage ?? "";
              }
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: hintText ?? '',
            filled: fillColor != null,
            fillColor: fillColor,
            contentPadding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
            // contentPadding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 15),
            isDense: true,
            counterText: '',
            // focusedBorder: OutlineInputBorder(
            //     borderSide: BorderSide(color: Theme.of(context).primaryColor)),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white)),
            // hintStyle: Regular.copyWith(color: Theme.of(context).hintColor),
            errorStyle: TextStyle(height: 1.5),
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide:
              BorderSide(color: Colors.white, width: 3.0),
            ),
          ),
        ),
      ),
    );
  }
}
