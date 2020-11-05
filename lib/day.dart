import 'package:cloud_firestore/cloud_firestore.dart';

class Day{
  Day(DocumentSnapshot doc){
    this.title = doc.data()['title'];

    final Timestamp timestamp = doc.data()['createdAt'];
    this.createdAt = timestamp.toDate();
  }

  String title;
  DateTime createdAt;
}