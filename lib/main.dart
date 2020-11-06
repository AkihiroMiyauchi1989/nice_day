import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nice_day/main_model.dart';
import 'package:provider/provider.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
       title:  'NiceDay',
       home: ChangeNotifierProvider<MainModel>(
         create: (_) => MainModel()..getDayListRealtime(),
         child: Scaffold(
            appBar: AppBar(
              title: Text('NiceDay'),
           ),
            body: Consumer<MainModel>(builder: (context, model, child) {
              final dayList = model.dayList;
              return ListView(
                children: dayList
                    .map(
                      (day) => ListTile(
                        title: Text(day.title),
                      ),
                )
                .toList(),
            );
           }),
         )
       ),
     );
   }
}
