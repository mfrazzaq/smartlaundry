import 'package:SmartLaundry/Screens/complain.dart';
import 'package:SmartLaundry/Screens/feedback.dart';
import 'package:SmartLaundry/Screens/home.dart';
import 'package:SmartLaundry/Screens/order_detail.dart';
import 'package:flutter/material.dart';

class CommonDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: mediaQueryData.size.height * 0.4,
            child: Image(
              image: AssetImage('assets/images/logo.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(Home.routeName);
            },
            leading: Icon(
              Icons.home,
              color: Colors.black,
              size: 25,
            ),
            title: Text("Home"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OrderDetail.routeName);
            },
            leading: Container(
              height: 25,
              width: 25,
              child: Image(
                image: AssetImage('assets/icons/details.png'),
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Order Detail"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(FeedbackScreen.routeName);
            },
            leading: Container(
              height: 25,
              width: 25,
              child: Image(
                image: AssetImage('assets/icons/feedback.png'),
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Feedback"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ComplainScreen.routeName);
            },
            leading: Container(
              height: 25,
              width: 25,
              child: Image(
                image: AssetImage('assets/icons/complain.png'),
                fit: BoxFit.cover,
              ),
            ),
            title: Text("Complain"),
          ),
        ],
      ),
    );
  }
}
