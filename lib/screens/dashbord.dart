import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:ui/widgets/expense_graph.dart';

class DetailPage extends StatefulWidget {
  
    final DateTime selectedDate; // New property to store selected date

  final Color color;
  final IconData icon;
  final String text;
  final String subtext;
  final double percentValue;
  
  

  DetailPage({
    required this.color,
    required this.icon,
    required this.text,
    required this.subtext,
    required this.percentValue,
    required this.selectedDate
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
    List<bool> checkBoxValues = [false, false, false];

  @override
  Widget build(BuildContext context) {
      Color progressColor = _getProgressColor(widget.percentValue);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
        Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios_new)),
      actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.more_vert,
              color: Color.fromARGB(255, 9, 9, 9),
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.text,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: const Color.fromARGB(255, 12, 12, 12),
              ),
            ),
            Text(
              widget.subtext,
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 20),
           Row(
             children: [
               CircularPercentIndicator(
                  radius: 60.0,
                  lineWidth: 15.0,
                  animation: true,
                  animationDuration: 2000,
                  percent: widget.percentValue,
                  center: Text("${(widget.percentValue * 100).toStringAsFixed(0)}%"),
                  progressColor: progressColor,
                ),
                SizedBox(width: 35,),
                 Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,

                   children: [
                    Text("Team",style: TextStyle(fontWeight: FontWeight.w800),),
                    SizedBox(height: 10,),
                     FlutterImageStack(
              imageList:const [
                "assets/img/360_F_370290384_K0VEqnA7kgxmabRn0QXiyBCbCyPGWNeh",
                "assets/img/4202105160650431621171243.jpg",
                "assets/img/dummy-profile.png",
                "assets/img/Sam+Breitmeyer.jpg",
              ],
              totalCount: 5,
              backgroundColor: const Color.fromARGB(255, 221, 193, 151),
              itemBorderColor: const Color.fromARGB(255, 221, 193, 151),
              extraCountTextStyle: TextStyle(color: Colors.white, fontSize: 10),
              itemRadius: 35,
              showTotalCount: true,
            ),
                                SizedBox(height: 10,),

            

                   ],
                 ),
                 

             ],
           ),
           SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left:38.0),
              child: Text("Deadline",style: TextStyle(fontWeight: FontWeight.bold),),
            ),

           Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 10,),
           Icon(Icons.calendar_month,color: Colors.grey,),
            Text(
                      DateFormat.yMMMMd().format(widget.selectedDate),
                      style: TextStyle(fontSize: 14, color:Colors.grey),
                    ),
                    Text("-"),
           Text(
                      DateFormat.yMMMMd().format(widget.selectedDate),
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
          ],
        ),
           SizedBox(height: 60,),
           Text("Project Progress",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 19)),
           SizedBox(height: 20),
            Column(
              children: [
                Row(children: [_buildCheckBox(0, Colors.blue),
                SizedBox(width: 20,),
                Text("Create user flow")
                ]),
                SizedBox(height: 10),
                Row(children:[ _buildCheckBox(1, Colors.blue),
                                SizedBox(width: 20,),

                Text("Create wireframe")]),
                SizedBox(height: 10),
                Row(children:[_buildCheckBox(2, Colors.blue),
                                SizedBox(width: 20,),

                Text("Transform to visual Design")] ),
              ],
            ),
            SizedBox(height: 20,),
          Text("Project Overview",style:TextStyle(fontWeight: FontWeight.w900,fontSize: 19)),

 Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: ExpenseGraphDesign(),
              ),
            ),         
          ],
        ),
      ),
    );
  }







  Widget _buildCheckBox(int index, Color boxColor) {
    return GestureDetector(
      onTap: () {
        setState(() {
          checkBoxValues[index] = !checkBoxValues[index];
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          color: checkBoxValues[index] ? boxColor : Colors.transparent,
          border: Border.all(color: boxColor),
          borderRadius: BorderRadius.circular(5),
        ),
        child: checkBoxValues[index]
            ? Icon(
                Icons.check,
                color: Colors.white,
                size: 20,
              )
            : null,
      ),
    );
  }


  
  Color _getProgressColor(double percentValue) {
  if (percentValue <= 0.25) {
    return Colors.red; // Example color for lower percentage
  } else if (percentValue <= 0.5) {
    return Colors.orange; // Example color for mid-range percentage
  } else if (percentValue <= 0.75) {
    return const Color.fromARGB(255, 59, 173, 255); // Example color for higher mid-range percentage
  } else {
    return Colors.green; // Example color for higher percentage
  }
}
}