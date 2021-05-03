import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {

  var ctl_productname = TextEditingController(); //Box1
  var ctl_price = TextEditingController();  //Box2
  var ctl_quantity = TextEditingController();  //Box3
  String result = '<<Result>>'; // Box4 for Result

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
      ),
      body: ListView(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: <Widget>[
                      Image.network(
                          'https://image.shutterstock.com/image-photo/red-apple-on-white-background-260nw-158989157.jpg'),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ctl_productname,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Product',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ctl_price,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Price',
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextField(
                          controller: ctl_quantity,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Quantity',
                          ),
                        
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: RaisedButton(
                          child: Text('Send to Server'),
                          onPressed: () {

                                _makePostRequest();
                              
                                var v1 = ctl_productname.text;
                                var v2 = int.parse(ctl_price.text) ;
                                var v3 = int.parse(ctl_quantity.text);
                                // int.parse() is convert str to integer
                                var calculate = v2 * v3;

                                setState(() {
                                  result = 'Product: $v1 Total: $calculate';
                                  // replace value to result variable
                                });                      

                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(result),
                      ),

                    ],
                  ),
                )
              ],
            ),
    );
  }

    Future<String> _makePostRequest() async {


          var v1 = ctl_productname.text.toString();
          var v2 = int.parse(ctl_price.text.toString());
          var v3 = int.parse(ctl_quantity.text.toString());

          // set up POST request arguments
          String url = 'http://uncle-bookstore.com/api/post';
          Map<String, String> headers = {"Content-type": "application/json"};

          String json = '{"name": "$v1", "price": $v2, "quan": $v3 ,"desc":"-"}';
          // make POST request
          var response = await http.post(url, headers: headers, body: json);
          // check the status code for the result
          int statusCode = response.statusCode;

          if (statusCode == 201) {

              showDialog<void>(
                      context: context,
                      barrierDismissible: false, // user must tap button!
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Success',style: TextStyle(fontFamily: 'THSarabun'),),
                          content: SingleChildScrollView(
                            child: ListBody(
                              children: <Widget>[
                                Icon(Icons.photo),
                                Text('บันทึกข้อมูลสำเร็จ',style: TextStyle(fontFamily: 'THSarabun'),),
                              ],
                            ),
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('ปิด'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );

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