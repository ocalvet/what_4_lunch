import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: InkWell(
              child: Container(
                width: double.infinity,
                child: Text('Hello'),
              ),
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }
}
