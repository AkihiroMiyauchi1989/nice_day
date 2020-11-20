import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nice_day/day.dart';

class MainModel extends ChangeNotifier {
  List<Day> dayList = [];
  String newDayText = '';

  Future getTodoList() async {
    final snapshot =
    await FirebaseFirestore.instance.collection('dayList').get();
    final docs = snapshot.docs;
    final dayList = docs.map((doc) => Day(doc)).toList();
    this.dayList = dayList;
    notifyListeners();
  }

  void getTodoListRealtime() {
    final snapshots =
    FirebaseFirestore.instance.collection('dayList').snapshots();
    snapshots.listen((snapshot) {
      final docs = snapshot.docs;
      final dayList = docs.map((doc) => Day(doc)).toList();
      dayList.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      this.dayList = dayList;
      notifyListeners();
    });
  }

  Future add() async {
    final collection = FirebaseFirestore.instance.collection('dayList');
    await collection.add({
      'title': newDayText,
      'createdAt': Timestamp.now(),
    });
  }

  void reload() {
    notifyListeners();
  }

  Future deleteCheckedItems() async {
    final checkedItems = dayList.where((day) => day.isDone).toList();
    final references =
    checkedItems.map((todo) => todo.documentReference).toList();

    final batch = FirebaseFirestore.instance.batch();

    references.forEach((reference) {
      batch.delete(reference);
    });
    return batch.commit();
  }

  bool checkShouldActiveCompleteButton() {
    final checkedItems = dayList.where((day) => day.isDone).toList();
    return checkedItems.length > 0;
  }
}