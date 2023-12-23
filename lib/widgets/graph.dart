import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class ExpenseGraphDesign extends StatefulWidget {
  const ExpenseGraphDesign({Key? key, }) : super(key: key);

  @override
  State<ExpenseGraphDesign> createState() => _ExpenseGraphDesignState();
}

class _ExpenseGraphDesignState extends State<ExpenseGraphDesign> {
  late List<FlSpot> spots = [
    FlSpot(0, 0),
    FlSpot(1, 6),
    FlSpot(2, 8),
    FlSpot(3, 6.2),
    FlSpot(4, 6),
    FlSpot(5, 8),
    FlSpot(6, 9),
  ];

  double getMaxYValue(List<FlSpot> spots) {
    double maxY = spots.isNotEmpty ? spots[0].y : 0;
    for (int i = 1; i < spots.length; i++) {
      if (spots[i].y > maxY) {
        maxY = spots[i].y;
      }
    }
    return maxY;
  }

  @override
  Widget build(BuildContext context) {
    double maxY = getMaxYValue(spots);

    return Container(
      height: 300, 
      padding: const EdgeInsets.all(16.0),
      child: LineChart(
        LineChartData(
          minX: 0,
          maxX: 6,
          minY: 0,
          maxY: maxY,
          backgroundColor: Colors.white,
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              gradient: const LinearGradient(
                colors: [
                 
                 
                ],
              ),
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    Colors.purple.withOpacity(0.2),
                    Colors.pink.withOpacity(0.2),
                  ],
                ),
              ),
              dotData: FlDotData(show: false),
              showingIndicators: List.generate(spots.length, (index) => index),
            ),
          ],
          gridData: FlGridData(
            show: false,
            drawHorizontalLine: false,
            drawVerticalLine: false,
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              bottom: BorderSide(
                color: Colors.grey.shade800,
                width: 0.8,
              ),
              left: BorderSide(
                color: Colors.black,
              ),
              right: BorderSide(
                color: Colors.transparent,
              ),
              top: BorderSide(
                color: Colors.transparent,
              ),
            ),
          ),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                interval: (maxY / 3).ceilToDouble(),
              ),
            ),
            rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 22,
                interval: 1,
                getTitlesWidget: (value, meta) {
                  String text = '';
                  switch (value.toInt()) {
                    case 1:
                      text = "Sun";
                      break;
                    case 2:
                      text = "Mon";
                      break;
                    case 3:
                      text = "Tue";
                      break;
                    case 4:
                      text = "Wed";
                      break;
                    case 5:
                      text = "Thurs";
                      break;
                    case 6:
                      text = "Fri";
                      break;
                    default:
                      return Container();
                  }
                  return Text(
                    text,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 31, 28, 28),
                      fontSize: 10,
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
