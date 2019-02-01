import 'package:flutter/material.dart';

class BigText extends StatelessWidget {
  final String text;

  const BigText({Key key, this.text}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.display1;
    return Text(
      text,
      style: textStyle,
      textAlign: TextAlign.center,
    );
  }
}