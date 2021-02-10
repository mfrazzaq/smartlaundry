import 'package:SmartLaundry/Services/common.dart';
import 'package:SmartLaundry/Widgets/drawer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = '/';
  @override
  Widget build(BuildContext context) {
    Firebase.initializeApp();
    final themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('The smart Laundry'),
        ),
        drawer: CommonDrawer(),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
            child: Column(
              children: [
                Text(
                  'We are passionate about laundry',
                  textAlign: TextAlign.center,
                  style: themeData.textTheme.headline1,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  Common.loremepsum,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  'Commercial Laundry Service',
                  style: themeData.textTheme.headline1,
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                Text(
                  Common.loremepsum,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
