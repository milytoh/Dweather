
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constant.dart';
import 'package:weather_app/screens/location_screen.dart';
import 'package:weather_app/screens/error_massage.dart';


class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String textFieldValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/city_background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topLeft,
                child: FlatButton(
                  onPressed: () {
                    Navigator.pop(context);

                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 50.0,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(20.0),
                child: TextField(
                  onChanged: (value) {
                    textFieldValue = value;
                  },
                  style: TextStyle(
                    color: Colors.black,
                  ),
                  decoration: kTextFieldDecoration,
                ),
              ),
              FlatButton(
                onPressed: () {
                  Navigator.pop(context, textFieldValue);
                },
                child: Text(
                  'Get Weather',
                  style: kButtonTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
