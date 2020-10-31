
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nice_day/signin.dart';

import 'login.dart';

class welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var widget;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(
                child: Text(
                  'NiceDay',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Theme
                        .of(context)
                        .primaryColor,
                  ),
                ),
                margin: EdgeInsets.only(
                    top: 110.0, right: 0.0, bottom: 110.0, left: 0.0)
            ),
            Container(
                child: RaisedButton(
                  child: Text('Log in'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                ),
                margin: EdgeInsets.only(
                    top: 0.0, right: 0.0, bottom: 40.0, left: 0.0)
            ),
            Container(
              child: OutlineButton(
                child: Text('Sign in'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SigninPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}