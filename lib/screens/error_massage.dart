
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/utilities/constant.dart';

class Error extends StatefulWidget {
  Error({this.massage});
  final massage;
  @override
  _ErrorState createState() => _ErrorState();
}
class _ErrorState extends State<Error> {
  String myMassage;
  String myMassageColor;
  @override
  void initState() {
    super.initState();
    massages(widget.massage);

  }
  String massages(String value){
    myMassage = value;
    return myMassage;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              " OOPS! we don't have data for the location: $myMassage",
              style: kErrorMassage,
              ),
            Text("please try to put a valid city name",style: kErrorMassage,),

          ],
        ),
        ),
      );
  }
}
