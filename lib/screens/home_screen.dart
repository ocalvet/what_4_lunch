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
                decoration: BoxDecoration(color: Colors.green),
                width: double.infinity,
                child: Center(
                  child: Text(
                    'Make Decision',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/make-decision');
              },
            ),
          ),
          Expanded(
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(color: Colors.orange),
                width: double.infinity,
                child: Center(
                  child: Text('Help Us Decide',
                      style: Theme.of(context).textTheme.title),
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/decision-helper');
              },
            ),
          ),
        ],
      ),
    );
  }
}
