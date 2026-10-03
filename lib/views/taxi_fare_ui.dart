// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';

class TaxiFareUI extends StatefulWidget {
  const TaxiFareUI({super.key});

  @override
  State<TaxiFareUI> createState() => _TaxiFareUIState();
}

class _TaxiFareUIState extends State<TaxiFareUI> {
  double price = 0;

  // สร้างตัวควบคุม TextField
  TextEditingController distanceCtrl = TextEditingController();
  TextEditingController timejamCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text(
          'Taxi Fare',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).size.height * 0.08,
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  'assets/images/taxi.png',
                  width: MediaQuery.of(context).size.width * 0.5,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.05,
                ),
                Text(
                  'คำนวณค่าโดยสารแท็กซี่',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.028,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'ระยะทาง (กิโลเมตร) ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/images/road.png',
                        width: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: distanceCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกระยะทาง',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Text(
                        'เวลารถติด (นาที) ',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.asset(
                        'assets/images/clock.png',
                        width: MediaQuery.of(context).size.width * 0.055,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: timejamCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    hintText: 'กรุณากรอกเวลารถติด',
                    hintStyle: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.035,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    contentPadding: EdgeInsets.all(20),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.035,
                ),
                ElevatedButton(
                  onPressed: () {
                    // ตรวจสอบป้อนข้อมูล
                    if (distanceCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.yellow,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text('  กรุณากรอกข้อมูลให้ครบถ้วน'),
                            ],
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    // ตรวจสอบป้อนเวลารถติด
                    if (timejamCtrl.text.isEmpty) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Row(
                            children: [
                              Icon(
                                Icons.warning_amber_rounded,
                                color: Colors.yellow,
                                size: MediaQuery.of(context).size.width * 0.05,
                              ),
                              Text('  กรุณากรอกข้อมูลให้ครบถ้วน'),
                            ],
                          ),
                          backgroundColor: Colors.red,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      return;
                    }
                    // คํานวณค่าโดยสาร
                    setState(() {
                      double distance = double.parse(distanceCtrl.text);
                      double timejam = double.parse(timejamCtrl.text);
                      if (distance <= 1) {
                        price = 35 + (timejam * 3);
                      } else if (distance >= 2 && distance <= 10) {
                        price = (distance * 6.50) + (timejam * 3);
                      } else if (distance > 10 && distance <= 20) {
                        price = (distance * 7.00) + (timejam * 3);
                      } else if (distance > 20 && distance <= 40) {
                        price = (distance * 8.00) + (timejam * 3);
                      } else if (distance > 40 && distance <= 60) {
                        price = (distance * 8.50) + (timejam * 3);
                      } else if (distance > 60 && distance <= 80) {
                        price = (distance * 9.00) + (timejam * 3);
                      } else {
                        price = (distance * 10.50) + (timejam * 3);
                      }
                    });
                  },
                  child: Text(
                    'คํานวณค่าโดยสาร',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                ElevatedButton(
                  onPressed: () {
                    distanceCtrl.clear();
                    timejamCtrl.clear();
                    setState(() {
                      price = 0;
                    });
                  },
                  child: Text(
                    'ยกเลิก',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.065,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.02,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  child: Container(
                    color: Colors.amber[100],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'ค่าโดยสารแท็กซี่',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          price.toStringAsFixed(2),
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.1,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                        Text(
                          'บาท',
                          style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.045,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
