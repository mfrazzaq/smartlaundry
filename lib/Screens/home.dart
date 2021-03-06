import 'package:SmartLaundry/Services/common.dart';
import 'package:SmartLaundry/Widgets/drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  static const routeName = '/home';
  final List<String> items = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
    'assets/images/5.jpg'
  ];
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  child: CarouselSlider(
                    options: CarouselOptions(
                        viewportFraction: 1.0,
                        disableCenter: true,
                        autoPlay: true,
                        aspectRatio: 2.0),
                    items: items
                        .map(
                          (e) => Container(
                            width: double.infinity,
                            height: 150,
                            child: Image(
                              image: AssetImage(e),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text(
                    'We are passionate about laundry',
                    textAlign: TextAlign.center,
                    style: themeData.textTheme.headline1,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  child: Divider(
                    thickness: 2,
                    color: Colors.blueGrey,
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    Common.passion,
                    textAlign: TextAlign.center,
                  ),
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
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Text(
                    Common.commercial,
                    textAlign: TextAlign.center,
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
