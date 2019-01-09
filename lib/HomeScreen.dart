import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('What4Lunch'),
      ),
      body: Container(
        child: Center(
          child: Text('Generate a place', style: Theme.of(context).textTheme.display1),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _generateRandomPlace,
        child: Icon(Icons.refresh),
      ),
    );
  }

  _generateRandomPlace() {
    print('Generate random place');
  }
}
