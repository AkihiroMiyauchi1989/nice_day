import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title:  'NiceDay',
       home: Scaffold(
          appBar: AppBar(
           title: Text('NiceDay'),
           ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                   'ここに文字が入るよ'
                )
            ],
          ),
         ),
       ),
     );
   }
}