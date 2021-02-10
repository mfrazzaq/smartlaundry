import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final Function(bool isSubmitted) statusChange;
  final dynamic response;
  Details({@required this.statusChange, @required this.response});

  List<Widget> getItems() {
    List<Widget> widgets = [];
    (response as Map<dynamic, dynamic>).forEach((key, value) {
      widgets.add(SingleDetail(label: key.toString(), title: value.toString()));
    });
    return [...widgets];
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    final mediaQuery = MediaQuery.of(context);
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              height: mediaQuery.size.height * 0.7,
              child: ListView(
                children: getItems(),
              ),
            ),
          ),
          RaisedButton(
            onPressed: () {
              statusChange(false);
            },
            child: Text(
              "Go back",
              style: themeData.textTheme.headline2
                  .copyWith(fontWeight: FontWeight.normal, color: Colors.white),
            ),
            color: Colors.blueAccent,
          )
        ],
      ),
    );
  }
}

class SingleDetail extends StatelessWidget {
  final String label;
  final String title;
  const SingleDetail({@required this.label, @required this.title});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      color: Colors.black12,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style: themeData.textTheme.headline2.copyWith(fontSize: 20)),
          SizedBox(
            height: 10,
          ),
          Text(title,
              style: themeData.textTheme.headline2.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.normal,
              )),
        ],
      ),
    );
  }
}
