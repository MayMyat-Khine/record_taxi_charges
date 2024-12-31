import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FirebaseService {
  static final FirebaseService _instance = FirebaseService._internal();
  FirebaseService._internal();

  factory FirebaseService() {
    return _instance;
  }

  final collectionName = "TaxiRecord";
  final subCollectionName = "May Myat";
  FirebaseFirestore db = FirebaseFirestore.instance;
  ValueNotifier<Map<String, List>> records =
      ValueNotifier<Map<String, List>>({});

  Future<void> deleteDate(String date) async {
    await db.collection(collectionName).doc(subCollectionName).update({
      date: FieldValue.delete(),
    }).then((_) {
      getDate();
    });
  }

  Future<void> getDate() async {
    records.value.clear();
    await db
        .collection(collectionName)
        .doc(subCollectionName)
        .get()
        .then((event) {
      if (event.data() != null) {
        for (var data in event.data()!.entries) {
          records.value[data.key] = data.value as List;
        }
        records.value = Map.from(records
            .value); // this line is important as it notify the UI rebuild
      }
    });
  }

  Future<void> addDate(DateTime date) async {
    DocumentReference subDocRef =
        db.collection(collectionName).doc(subCollectionName);

    Map<String, List> data = {
      DateFormat('MM-dd-yyyy').format(date).toString(): [false, false]
    };

    await subDocRef.set(data, SetOptions(merge: true));
    getDate();
  }

  Future<void> setRecord(String date, bool value, int valueIndex) async {
    Map<String, List> data = {
      date: [false, false]
    };
    try {
      DocumentSnapshot field =
          await db.collection(collectionName).doc(subCollectionName).get();
      if (field.exists) {
        List<dynamic> bools = (field.data() as Map)
            .entries
            .firstWhere((element) => element.key == date)
            .value;
        bools[valueIndex] = value;
        await db
            .collection(collectionName)
            .doc(subCollectionName)
            .update({date: bools});
        print("Updated data field successfully.");
      } else {
        print("Index out of bounds");
        return;
      }
    } catch (e) {
      print(e);
    }
    getDate();
  }
}
