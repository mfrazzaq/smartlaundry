import 'package:SmartLaundry/Screens/complain.dart';
import 'package:SmartLaundry/Screens/feedback.dart';
import 'package:SmartLaundry/Screens/home.dart';
import 'package:SmartLaundry/Screens/order_detail.dart';
import 'package:SmartLaundry/Screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          headline2: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      home: SplashScreen(),
      routes: {
        OrderDetail.routeName: (context) => OrderDetail(),
        FeedbackScreen.routeName: (context) => FeedbackScreen(),
        ComplainScreen.routeName: (context) => ComplainScreen(),
        Home.routeName: (context) => Home()
      },
    );
  }
}
