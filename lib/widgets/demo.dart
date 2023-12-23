// import 'package:fl_chart/fl_chart.dart';
// import 'package:flutter/material.dart';
// import 'package:ui/screens/dashbord.dart';

// // Existing code...

// class _DetailPageState extends State<DetailPage> {
//   // Existing code...

//   @override
//   Widget build(BuildContext context) {
//     // Existing code...

//     return Scaffold(
//       appBar: AppBar(
//         // Existing code...
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: SingleChildScrollView(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Existing code...

//               // Placeholder for Project Overview
//               Text("Project Overview",
//                   style:
//                       TextStyle(fontWeight: FontWeight.w900, fontSize: 19)),
//               SizedBox(height: 20),

//               // Spline chart
//               Container(
//                 height: 300,
//                 child: LineChart(
//                   LineChartData(
//                     minX: 0,
//                     maxX: 4,
//                     minY: 0,
//                     maxY: 12,
//                     lineBarsData: [
//                       LineChartBarData(
//                         spots: [
//                           FlSpot(0, 0),
//                           FlSpot(1, 2),
//                           FlSpot(2, 5),
//                           FlSpot(3, 10),
//                         ],
//                         isCurved: true,
//                         colors: [Colors.blue],
//                         barWidth: 2,
//                         belowBarData: BarAreaData(show: false),
//                         dotData: FlDotData(show: false),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Existing methods...
// }
