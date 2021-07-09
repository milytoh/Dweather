import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Spartan MB',
  fontSize: 60.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Spartan MB',
);

const kConditionTextStyle = TextStyle(
  fontSize: 100.0,
);

const kTextFieldDecoration = InputDecoration(
  hintText: 'Your Location',
  hintStyle: TextStyle(
    color: Colors.grey,
    fontSize: 18,
  ),
  border: OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.all(
      Radius.circular(10),
    ),
  ),
  icon: Icon(
    Icons.location_city,
    color: Colors.white,
  ),
  filled: true,
  fillColor: Colors.white,

);

const kErrorMassage = TextStyle(
  color: Colors.white,
  fontSize: 30,
  fontFamily: 'Spartan MB',
);