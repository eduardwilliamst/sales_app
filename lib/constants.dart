import 'package:flutter/material.dart';

const kPrimaryColor = Color.fromRGBO(164, 114, 61, 1.0);
const kSecondaryColor = Colors.white;
const kTextFormFieldColor = Color.fromRGBO(245, 245, 245, 1.0);
const kContentColorLightTheme = Color.fromRGBO(29, 29, 53, 1);
const kContentColorDarkTheme = Color(0xFFF5FCF9);
const kSuccessColor = Color.fromRGBO(80, 163, 135, 1.0);
const kWarninngColor = Color.fromRGBO(250, 255, 19, 1.0);
const kErrorColor = Color.fromRGBO(231, 13, 13, 1.0);

const kDefaultPadding = 16.0;

final ButtonStyle primaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kPrimaryColor,
  padding: const EdgeInsets.symmetric(vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
  ),
);

final ButtonStyle secondaryButtonStyle = ElevatedButton.styleFrom(
  backgroundColor: kSecondaryColor,
  padding: const EdgeInsets.symmetric(vertical: 8),
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    side: const BorderSide(
      width: 3,
      color: kPrimaryColor,
    ),
  ),
);
