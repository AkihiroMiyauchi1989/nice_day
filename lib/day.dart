import 'package:cloud_firestore/cloud_firestore.dart';

class Day{
  Day(DocumentSnapshot doc){
    this.title = doc.data()['title'];
    this.createdAt = doc.data()['createdAt'];
  }
  String title;
  DateTime createdAt;
}