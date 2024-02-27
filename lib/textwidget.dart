import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Divider in Row Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Items separated by a Divider:',
              style: TextStyle(fontSize: 18.0),
            ),
            SizedBox(height: 10.0),
            Divider(), // Divider goes here
            SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Divider(), // Divider goes here
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                Divider(), // Divider goes here
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
