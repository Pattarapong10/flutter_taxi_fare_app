import 'package:flutter/material.dart';
import 'package:flutter_taxi_fare_app/views/taxi_fare_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // หน่วงเวลา
    Future.delayed(
        Duration(
          seconds: 3,
        ), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => TaxiFareUI(),
        ),
      );
    });
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/taxi.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Taxi Fare Calculator',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: MediaQuery.of(context).size.height * 0.029,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.015,
            ),
            Text(
              'คำนวณค่าโดยสารแท็กซี่',
              style: TextStyle(
                color: Colors.lightBlueAccent,
                fontSize: MediaQuery.of(context).size.height * 0.021,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.045,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              child: CircularProgressIndicator(
                color: Colors.orange[200],
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
