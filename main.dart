import 'package:flutter/material.dart';

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
      ],
    );
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
