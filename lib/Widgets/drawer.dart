import 'package:SmartLaundry/Screens/complain.dart';
import 'package:SmartLaundry/Screens/feedback.dart';
import 'package:SmartLaundry/Screens/home.dart';
import 'package:SmartLaundry/Screens/order_detail.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final mediaQueryData = MediaQuery.of(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: mediaQueryData.size.height * 0.4,
            color: Colors.blueAccent,
            child: Center(
              child: Text(
                'Welcome to the smart laundry',
                textAlign: TextAlign.center,
                style:
                    themeData.textTheme.headline1.copyWith(color: Colors.white),
              ),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Home.routeName);
            },
            leading: Icon(
              Icons.home,
              size: 25,
              color: Colors.black,
            ),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderDetail.routeName);
            },
            leading: Icon(
              Icons.details_sharp,
              size: 25,
              color: Colors.black,
            ),
            title: Text("Order Detail"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FeedbackScreen.routeName);
            },
            leading: Icon(
              Icons.feedback,
              size: 25,
              color: Colors.black,
            ),
            title: Text("Feedback"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ComplainScreen.routeName);
            },
            leading: Icon(
              Icons.feedback,
              size: 25,
              color: Colors.black,
            ),
            title: Text("Complain"),
          ),
        ],
      ),
    );
  }
}
