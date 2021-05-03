# Flutter
Flutter Tutorial

ลุงสอนเขียนแอพ Flutter แบบมาราธอน 11 ชั่วโมง สอนตั้งแต่ติดตั้งเครื่องมือทุกอย่างสำหรับการพัฒนาแอพทั้ง Android , iOS สร้างโปรเจคตัวอย่างชื่อแอพว่า "เด็กนาย" แอพนี้ใช้สำหรับเด็กคนหนึ่งที่ถูกนายสั่งให้ไปหาซื้อของตามรายการที่นายสั่งไว้ โดยมีช่องกรอกข้อมูล 3 ช่องคือ สินค้าที่หาได้ ราคาและจำนวน โดยแอพจะทำการคำนวณค่าใช้จ่ายให้ทั้งหมดให้ แล้วบันทึกส่งไปเก็บบน server ทดลอง: http://uncledjango50.com:8000/ นายสามารถเช็คได้ว่ามีของอะไรส่งไปเก็บแล้วบ้างผ่าน: http://uncledjango50.com:8000/api 

วิดีโอสอน: 
Youtube: https://youtu.be/rYe-tfs0pOk
FB1: https://fb.watch/5fQ5sG1UiJ/
FB2: https://fb.watch/5fQ6SEpfQy/

สำหรับ EP นี้สอนไว้แค่นี้ก่อน....โปรดติดตาม EP หน้าอีก 10 ชั่วโมง+ 

Source Code: https://github.com/UncleEngineer/Flutter
Source Code Project [อัพโหลดข้อมูลสำเร็จ]: https://github.com/UncleEngineer/Flutter/blob/main/firstapp.zip



------------------

วิธีแก้ Insecure HTTP is not allowed by platform: <host> ใน Flutter 2.0

error นี้ จะเกิดขึ้นเมื่อเขียนแอพที่ใช้งาน network ทั้ง Android และ iOS
ในเวอร์ชั่นที่สูงขึ้น ต้องมีการ migration โดยจะเริ่มต้นที่ Android 9
(API 28) และ iOS 9 เป็นต้นไป

ขั้นตอน (เฉพาะฝั่ง Android)
1. ไปที่โฟลเดอร์โปรเจคของเรา เข้าให้ถึงโฟลเดอร์ res
$project_path\android\app\src\main\res\

2. ให้สร้างโฟลเดอร์ xml และในโฟลเดอร์ xml ให้สร้างไฟล์ network_security_config.xml

3. copy & paste ซอร์สโค้ด จากลิงก์นี้
https://developer.android.com/training/articles/security-config#CleartextTrafficPermitted
ข้างในแท็ก <domain> ให้แก้เป็นเว็บของเรา เสร็จแล้วเซฟไฟล์

4. เปิดไฟล์ AndroidManifest.xml จาก path  $project_path\android\app\src\main\
ให้ copy & paste ซอร์สโค้ด จากลิงก์ https://flutter.dev/docs/release/breaking-changes/network-policy-ios-android#migration-guide
วางให้อยู่ด้านในแท็ก <application> เสร็จแล้วเซฟไฟล์

5. เปิดไฟล์ AndroidManifest.xml จาก path
$project_path\android\app\src\debug\
ให้ copy & paste ซอร์สโค้ดข้างล่างนี้
<application android:usesCleartextTraffic="true"/>
เสร็จแล้วเซฟไฟล์ จากนั้นรันแอปด้วยคำสั่ง flutter run
