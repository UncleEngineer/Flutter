import 'package:flutter/material.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('First App by Uncle'),
              centerTitle: true,
            ),
            body: Home()));
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Center(
          child: Text(
            'สวัสดีชาวโลก',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 50.0,
                color: Colors.blue[900],
                fontFamily: 'SdProtector'),
          ),
        ),
        Icon(
          Icons.alarm,
          size: 100,
        )
      ],
    );
  }
}
