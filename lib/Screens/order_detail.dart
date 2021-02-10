import 'package:SmartLaundry/Widgets/details.dart';
import 'package:SmartLaundry/Widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:SmartLaundry/Widgets/detail_form.dart';

class OrderDetail extends StatefulWidget {
  static const routeName = "/Order-Detail";

  @override
  _OrderDetailState createState() => _OrderDetailState();
}

class _OrderDetailState extends State<OrderDetail> {
  bool _isSubmitted = false;
  dynamic response;
  void onChange(bool isSubmitted) {
    setState(() {
      _isSubmitted = isSubmitted;
    });
  }

  void getResponse(dynamic result) {
    response = result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Order Detail"),
        ),
        drawer: CommonDrawer(),
        body: _isSubmitted
            ? Details(
                statusChange: onChange,
                response: response,
              )
            : DetailForm(
                statusChange: onChange,
                response: getResponse,
              ),
      ),
    );
  }
}
