import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontSize: 120.0,
);
const kdescStyle = TextStyle(
  fontSize: 30.0,
);
const kdateStyle = TextStyle(
  fontSize: 25.0,
);
const kMessageTextStyle = TextStyle(
  fontSize: 60.0,
);
const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontWeight: FontWeight.w900,
  color: Colors.white,
);
const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kPrimaryColor = Color(0xFF3ED520);
const kPrimaryLightColor = Color(0xFFFFECDF);
const kPrimaryGradientColor = LinearGradient(
  begin: Alignment.topLeft,
  end: Alignment.bottomRight,
  colors: [Color(0xFFFFA53E), Color(0xFFFF7643)],
);
const kSecondaryColor = Color(0xFF979797);
const kTextColor = Colors.black;

const kAnimationDuration = Duration(milliseconds: 200);

const headingStyle = TextStyle(
  fontSize: 26,
  fontWeight: FontWeight.bold,
  color: Colors.black,
  height: 1.5,
);

const defaultDuration = Duration(milliseconds: 250);

OutlineInputBorder outlineInputBorder() {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(16),
    borderSide: const BorderSide(color: kTextColor),
  );
}
