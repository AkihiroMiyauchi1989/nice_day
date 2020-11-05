import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nice_day/day.dart';

class MainModel extends ChangeNotifier {
  List<Day> dayList = [];

  Future getNiceDay() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('dayList').get();
    final docs = snapshot.docs;
    final dayList = docs.map((doc) => Day(doc)).toList();
    this.dayList = dayList;
    notifyListeners();
  }
}