import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class DetailForm extends StatefulWidget {
  final Function(bool isSubmitted) statusChange;
  final Function(dynamic response) response;
  DetailForm({@required this.statusChange, @required this.response});
  @override
  _DetailFormState createState() => _DetailFormState();
}

class _DetailFormState extends State<DetailForm> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  String code;
  FirebaseApp app;
  DatabaseReference _dbref;

  void onSubmit() async {
    final isValidate = _fromKey.currentState.validate();
    if (isValidate) {
      _fromKey.currentState.save();
      print(code);
      _dbref
          .orderByChild('serial_number')
          .equalTo(int.parse(code))
          .once()
          .then((snapShot) {
        if (snapShot.value == null) {
          print("new");
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('You have entered the wrong serial number'),
            ),
          );
        } else {
          FocusScope.of(context).unfocus();
          Map<dynamic, dynamic> response;
          (snapShot.value as Map<dynamic, dynamic>).forEach((key, value) {
            response = value;
          });
          if (response != null) {
            Map<dynamic, dynamic> result = {
              'Name': response['name'],
              'Status': response['status'],
              'Item Name': response['cattype'],
              'Serial Number': response['serial_number'],
              'Date of Order': response['order_date'],
              'Return Date': response['return_date']
            };

            widget.response(result);
            widget.statusChange(true);
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('You have entered the wrong serial number'),
              ),
            );
          }
        }
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        _fromKey.currentState.reset();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.reference().child('orderitems');
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Form(
      key: _fromKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Enter a serial number"),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Please enter a valid value';
                }
                return null;
              },
              onSaved: (value) {
                code = value;
              },
            ),
            RaisedButton(
              onPressed: onSubmit,
              child: Text(
                "Check Status",
                style: themeData.textTheme.headline2.copyWith(
                    fontWeight: FontWeight.normal, color: Colors.white),
              ),
              color: Colors.blueAccent,
            )
          ],
        ),
      ),
    );
  }
}
