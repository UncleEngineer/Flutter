import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text('แอพบันทึกของที่ซื้อแล้ว'),
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
  var ctl_product = TextEditingController();
  var ctl_price = TextEditingController();
  var ctl_quantity = TextEditingController();
  var result = '------Result------';
  var result2 = '------สถานะ------';

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: Text(
                'เด็กนาย',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50.0,
                    color: Colors.blue[900],
                    fontFamily: 'SdProtector'),
              ),
            ),
            Icon(
              Icons.add_comment,
              size: 100,
              color: Colors.blue[900],
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
          child: Image.asset(
            'assets/bike.png',
            scale: 0.7,
          ),
        ),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: TextField(
              controller: ctl_product,
              decoration: InputDecoration(
                  labelText: 'สินค้า', border: OutlineInputBorder()),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: TextField(
              controller: ctl_price,
              decoration: InputDecoration(
                  labelText: 'ราคา', border: OutlineInputBorder()),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: TextField(
              controller: ctl_quantity,
              decoration: InputDecoration(
                  labelText: 'จำนวน', border: OutlineInputBorder()),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: ElevatedButton(
              style: raisedButtonStyle,
              onPressed: () {
                var v1 = int.parse(ctl_price.text);
                var v2 = int.parse(ctl_quantity.text);
                var calculate = v1 * v2;
                print("Cal: $calculate Baht ");
                var productname = ctl_product.text;
                setState(() {
                  result =
                      "สินค้า: $productname\nราคา: $v1\nจำนวน: $v2\nรวมทั้งหมด: $calculate บาท";
                  result2 = '...';
                  _makePostRequest();
                });
              },
              child: Text('ส่งข้อความไปหานาย'),
            )

            // ElevatedButton(
            //   onPressed: () {
            //     var v1 = int.parse(ctl_price.text);
            //     var v2 = int.parse(ctl_quantity.text);
            //     var calculate = v1 * v2;
            //     print("Cal: $calculate Baht ");
            //     var productname = ctl_product.text;
            //     setState(() {
            //       result =
            //           "สินค้า: $productname\nราคา: $v1\nจำนวน: $v2\nรวมทั้งหมด: $calculate บาท";
            //     });
            //   },
            //   child: Row(
            //     children: [Icon(Icons.send), Text('ส่งข้อความไปหานาย')],
            //   ),
            // )
            ),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Text(
              result,
              style: TextStyle(fontSize: 30.0),
            )),
        Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
            child: Text(
              result2,
              style: TextStyle(fontSize: 10.0),
            )),
      ],
    );
  }

  Future<String> _makePostRequest() async {
    var v1 = ctl_product.text.toString();
    var v2 = int.parse(ctl_price.text.toString());
    var v3 = int.parse(ctl_quantity.text.toString());

    // set up POST request arguments
    String url = 'http://uncledjango50.com:8000/api/post';
    Map<String, String> headers = {"Content-type": "application/json"};

    String json = '{"name": "$v1", "price": $v2, "quan": $v3 ,"desc":"-"}';
    // make POST request
    var response = await http.post(url, headers: headers, body: json);
    // check the status code for the result
    int statusCode = response.statusCode;

    if (statusCode == 201) {
      setState(() {
        result2 = 'บันทึกสำเร็จ';
      });
    }

    // this API passes back the id of the new item added to the body
    String body = response.body;
    print('---CODE---');
    print(statusCode);
    print('---BODY---');
    print(body);
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
  }
}

final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
  onPrimary: Colors.blue[400],
  primary: Colors.blue[900],
  minimumSize: Size(88, 50),
  padding: EdgeInsets.symmetric(horizontal: 16),
  shape: const RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(5)),
  ),
);
