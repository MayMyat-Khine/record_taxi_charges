import 'package:flutter/material.dart';
import 'package:record_taxi_fees/firebase_service.dart';

class RecordPage extends StatelessWidget {
  RecordPage({super.key});
  FirebaseService fbs = FirebaseService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Record Taxi'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                  onPressed: () {
                    // fbs.addData();
                    datePick(context, fbs.addDate);
                  },
                  child: const Icon(Icons.calendar_month)),
              Text(fbs.subCollectionName),
              const SizedBox(
                width: 20,
              )
            ],
          ),
          ElevatedButton(
              onPressed: () {
                fbs.getDate();
              },
              child: const Text("Get Data")),
          ValueListenableBuilder(
            valueListenable: fbs.records,
            builder: (context, records, child) {
              return Column(
                children: [
                  ...records.entries.map((day) {
                    return GestureDetector(
                      onLongPress: () {
                        print("delete");
                        fbs.deleteDate(day.key);
                      },
                      child: Row(
                        children: [
                          Text(
                            "${day.key}",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          ...day.value.asMap().entries.map((element) {
                            int index = element.key;
                            bool value = element.value;
                            return Checkbox(
                                value: value,
                                onChanged: (v) {
                                  // call update and change data at db
                                  // dialog(context, () {
                                  //   fbs.setRecord(day.key, v!, index);
                                  // });
                                  fbs.setRecord(day.key, v!, index);
                                });
                          })
                        ],
                      ),
                    );
                  })
                ],
              );
            },
          )
        ],
      ),
    );
  }

  dialog(BuildContext context, Function func) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text("Are You Sure to change"),
          actions: [
            ElevatedButton(
                onPressed: () {
                  func();
                  Navigator.pop(context);
                },
                child: const Text("Yes")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("No"))
          ],
        );
      },
    );
  }

  datePick(BuildContext context, Future<void> Function(DateTime) func) async {
    DateTime? selectDate = await showDatePicker(
        context: context,
        firstDate: DateTime.now().subtract(const Duration(days: 30)),
        lastDate: DateTime.now().add(const Duration(days: 300)));

    if (selectDate != null) {
      // add the date to db
      func(selectDate);
    }
  }
}
