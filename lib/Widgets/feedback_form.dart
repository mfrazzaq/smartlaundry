import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class FeedbackForm extends StatefulWidget {
  final bool isComplain;
  FeedbackForm({@required this.isComplain});
  @override
  _FeedbackFormState createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  DatabaseReference _dbref;
  DatabaseReference _dbFeedBackRef;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Map<String, String> data = {'invoice': '', 'comment': ''};
  void onSubmit() {
    final isValidate = _formKey.currentState.validate();
    if (isValidate) {
      _formKey.currentState.save();
      print(data['invoice'] + ' ' + data['comment']);
      _dbref
          .orderByChild('serial_number')
          .equalTo(int.parse(data['invoice']))
          .once()
          .then((snapShot) {
        if (snapShot.value == null) {
          Scaffold.of(context).showSnackBar(
            SnackBar(
              content: Text('You have entered the wrong invoice'),
            ),
          );
        } else {
          FocusScope.of(context).unfocus();
          Map<dynamic, dynamic> response;
          (snapShot.value as Map<dynamic, dynamic>).forEach((key, value) {
            response = value;
          });
          if (response != null) {
            _dbFeedBackRef
                .orderByChild('serialnumber')
                .equalTo(int.parse(data['invoice']))
                .once()
                .then((value) {
              if (value.value != null) {
                Scaffold.of(context).showSnackBar(
                  SnackBar(
                    content: Text(widget.isComplain
                        ? 'You have already regestered your complain on the given invoice'
                        : 'You have already given the feedback on the given invoice'),
                  ),
                );
              } else {
                FocusScope.of(context).unfocus();
                Map<dynamic, dynamic> response;
                (snapShot.value as Map<dynamic, dynamic>).forEach((key, value) {
                  response = value;
                });

                _dbFeedBackRef.child(response['id'].toString()).set({
                  'msg': data['comment'],
                  'salemanid': response['salemanid'],
                  'serialnumber': response['serial_number']
                });
              }
            });
          } else {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('You have entered the wrong invoice'),
              ),
            );
          }
        }
      });
    } else {
      Future.delayed(Duration(seconds: 2), () {
        _formKey.currentState.reset();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _dbref = FirebaseDatabase.instance.reference().child('orderitems');
    if (widget.isComplain) {
      _dbFeedBackRef = FirebaseDatabase.instance.reference().child('complain');
    } else {
      _dbFeedBackRef = FirebaseDatabase.instance.reference().child('feedback');
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Form(
      key: _formKey,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please invoice code in the field';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(labelText: "Your invoice number"),
                onSaved: (value) {
                  data['invoice'] = value;
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              child: TextFormField(
                validator: (value) {
                  if (value.isEmpty) {
                    return widget.isComplain
                        ? 'Please write your complain'
                        : 'Please give feedback in the field';
                  }
                  return null;
                },
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.newline,
                maxLines: null,
                decoration: InputDecoration(
                    labelText: widget.isComplain ? "Complain" : "Comment"),
                onSaved: (value) {
                  data['comment'] = value;
                },
              ),
            ),
            RaisedButton(
              onPressed: onSubmit,
              child: Text(
                "Submit",
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
