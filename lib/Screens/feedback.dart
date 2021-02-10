import 'package:SmartLaundry/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:SmartLaundry/Widgets/feedback_form.dart';

class FeedbackScreen extends StatelessWidget {
  static const routeName = "/Feedback";
  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Feedback",
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
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 10),
                child: Text(
                  'Share your feedback',
                  style: themeData.textTheme.headline1,
                ),
              ),
              FeedbackForm(
                isComplain: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
