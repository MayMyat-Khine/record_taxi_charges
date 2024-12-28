// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   HomePage({super.key});

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   final List<String> days = ["Sun", "Mon", "Tue", "Wed", "Thurs", "Fri", "Sat"];
//   DateTime currentDate = DateTime.now();

//   @override
//   void initState() {
//     super.initState();
//     arrangeDate();
//   }

//   Map<String, Map> wholeMonth = {}; // {"Dec",{27,"Fri"}}
//   arrangeDate() {
//     int currentDay = currentDate.day;
//     DateTime startDate = DateTime(currentDate.year, currentDate.month, 1);
//     DateTime endDate = DateTime(currentDate.year, currentDate.month + 1, 0);
//     int currentWeekDay = currentDate.weekday;

//     print(currentDay);
//     print(currentWeekDay);
//   }

//   addingMonthWithDates(Map<int, int> start, Map<int, int> end) {
//     for(inde )
//   }

//   // DateTime getCurrentWeekDay(int weekday) {
//   //   var result;
//   //   switch (weekday) {
//   //     case 1:
//   //       result = DateTime.monday;
//   //       break;
//   //     case 2:
//   //       result = DateTime.tuesday;
//   //       break;
//   //     case 3:
//   //       result = DateTime.wednesday;
//   //       break;
//   //     case 4:
//   //       result = DateTime.thursday;
//   //       break;
//   //     case 5:
//   //       result = DateTime.friday;
//   //       break;
//   //     case 6:
//   //       result = DateTime.saturday;
//   //       break;
//   //     case 7:
//   //       result = DateTime.sunday;
//   //       break;
//   //     default:
//   //   }
//   //   return result;
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Record For Taxi Fees"),
//       ),
//       body: Column(
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               IconButton(
//                   onPressed: () {
//                     print("Previous Month");
//                   },
//                   icon: const Icon(Icons.arrow_back)),
//               const Text("Dec"),
//               IconButton(
//                   onPressed: () {
//                     print("Next Month");
//                   },
//                   icon: const Icon(Icons.arrow_forward))
//             ],
//           ),
//           const SizedBox(
//             height: 20,
//           ),
//           Container(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                   children: [
//                     ...days.map((day) {
//                       return Container(
//                         child: Text(day),
//                       );
//                     })
//                   ],
//                 )
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
