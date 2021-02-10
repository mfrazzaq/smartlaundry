import 'package:SmartLaundry/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:SmartLaundry/Widgets/feedback_form.dart';

class ComplainScreen extends StatelessWidget {
  static const routeName = "/Complain";
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Complain",
          ),
        ),
        drawer: CommonDrawer(),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 40, horizontal: 10),
                child: Text(
                  'Register Complain',
                  style: themeData.textTheme.headline1,
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Text(
                  'We\'ll very glad to help you out',
                  style: themeData.textTheme.headline1.copyWith(fontSize: 15),
                ),
              ),
              FeedbackForm(
                isComplain: true,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
