import 'package:apiapp/pages/addproduct.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API App',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String result = '----<<Result>>-----';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              Container(
                height: 100,
                color: Colors.blue,
              ),

              Text('TEST DRAWER'),
              //////ADD PRODUCT///////
              ListTile(
                leading: Icon(Icons.category),
                title: Text(
                  'เพิ่มสินค้า',
                  style: TextStyle(fontFamily: 'THSarabun', fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AddProduct()),
                  );
                },
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text('API App'),
        ),
        body: ListView(
          children: <Widget>[
            Text(
              result,
              style: TextStyle(fontFamily: 'THSarabun', fontSize: 30),
            ),
            RaisedButton(
              child: Text('GET Data'),
              onPressed: () {
                print('TEST GET DATA');
                _makeGetRequest();
              },
            )
          ],
        ),
      ),
    );
  }

  Future<String> _makeGetRequest() async {
    // make GET request
    String url = 'http://uncledjango50.com:8000/api/';
    //String url = 'http://uncle-flutter.com/api';
    var response = await http.get(url);
    // sample info available in response
    int statusCode = response.statusCode;
    Map<String, String> headers = response.headers;
    String contentType = headers['content-type'];
    String datajson = response.body;
    print(datajson);
    print(statusCode);

    // var list = json.decode(datajson);
    var list = json.decode(utf8.decode(response.bodyBytes));
    List itemlist = list.map((i) => i).toList();
    print(itemlist[0]['name']);

    setState(() {
      result = itemlist[0]['name'];
    });

    // TODO convert json to object...
  }
}
