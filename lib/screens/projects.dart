import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intl/intl.dart';
import 'package:ui/screens/dashbord.dart';
 
class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> with TickerProviderStateMixin {
  
   late TabController tabController;
   late DateTime selectedDate1; // Initialize with the current date
  late DateTime selectedDate2; // Initialize with the current date

final List<Color> cardColors = [
    Colors.white,
    Colors.white,
    Colors.white,
    Colors.white,
  ];
  final List<String> cardsubTexts = [
    'Today shared b y - Unbox Digitals',
    'Today shared b y - UI Been',
    'Today shared b y - Unbox ',
    'Today shared b y - Unbox Digitals',
  ];

  final List<String> cardTexts = [
    'App Animations',
    'Ongoing',
    'Completed',
    'Cancel',
  ];

  final List<IconData> cardIcons = [
    Icons.access_time_outlined,
    Icons.repeat_rounded,
    Icons.check_box_outlined,
    Icons.cancel_presentation_outlined,
  ];

  

 Future<void> _selectDate(BuildContext context, int dateNumber) async {
  final DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2023),
    lastDate: DateTime(2024),
  );
  if (picked != null && mounted) {
    setState(() {
      if (dateNumber == 1) {
        selectedDate1 = picked;
      } else {
        selectedDate2 = picked;
      }
    });
  }
}


  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
    selectedDate1 = DateTime.now(); // Initialize selectedDate1 with the current date
    selectedDate2 = DateTime.now(); // Initialize selectedDate2 with the current date
  }

  @override
  Widget build(BuildContext context) {
        double containerWidth = MediaQuery.of(context).size.width * 0.9; // Adjust the percentage as needed

    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ListTile(leading:   CircleAvatar(
                backgroundImage: AssetImage('assets/img/avatar.png'),
                
              ),
              trailing: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 9, 9, 9),
                ),
                onPressed: () {},
              ),
              ),
              SizedBox(height: 20,),
           Row(
      children: [
      SizedBox(width: 10), // Add left space here, adjust the width as needed
      Text(
        "Projects",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      ],
    ),
    SizedBox(height: 20,),
        
              Expanded(
                child: Column(
                  children: [
                    Container(
                      width: containerWidth,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(42),
                      ),
                      child: TabBar(
                          overlayColor: MaterialStateProperty.all(Colors.transparent),
        
                         unselectedLabelColor: Colors.black,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicator: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [const Color.fromARGB(255, 82, 154, 255), Color.fromARGB(255, 128, 156, 198)],
                      ),
                      borderRadius: BorderRadius.circular(50),
                      color: Color.fromARGB(255, 128, 156, 198),
                    ),
                        controller: tabController,
                        isScrollable: true,
                        labelPadding: EdgeInsets.symmetric(horizontal: 50),
                        tabs: [
                          Tab(child: Text("All")),
                          Tab(child: Text("Ongoing")),
                          Tab(child: Text("Completed")),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Expanded(
                      child: TabBarView(
                        controller: tabController,
                        children: [
     SingleChildScrollView(
       child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildCard(cardColors[0], cardIcons[0], cardTexts[0],cardsubTexts[0],0.65),
                      SizedBox(height: 20,),
                      _buildCard(cardColors[1], cardIcons[1], cardTexts[1],cardsubTexts[1],0.9),
                                          SizedBox(height: 20,),
    
                                        _buildCard(cardColors[2], cardIcons[2], cardTexts[2],cardsubTexts[2],0.3),
                       SizedBox(height: 20,),
                                        _buildCard(cardColors[3], cardIcons[3], cardTexts[3],cardsubTexts[3],0.1),
    
                    ],
                  ),
     ),
                SizedBox(height: 20),
                
                          
                          // Content for the 'All' tab
                          Center(
                            child: Text(
                              "All Tab Content",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Content for the 'Ongoing' tab
                          Center(
                            child: Text(
                              "Ongoing Tab Content",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                          // Content for the 'Completed' tab
                          Center(
                            child: Text(
                              "Completed Tab Content",
                              style: TextStyle(fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget _buildCard(Color color, IconData icon, String text,String subtext,double percentValue ) {
       Color progressColor = _getProgressColor(percentValue);
    return GestureDetector(
      onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailPage(
            color:  Colors.white,
            icon: icon,
            text: text,
            subtext: subtext,
            percentValue: percentValue,
            selectedDate: selectedDate1,
            
          ),
        ),
      );
    },
      child: SizedBox(
            width: 610, // Set the desired width
      height: 300, // Set the desired height
    
        child: Card(
          elevation: 3,
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Align text at the start
          crossAxisAlignment: CrossAxisAlignment.start,             children: [
              // Icon(
              //   icon,
              //   size: 48,
              //   color: Colors.white,
              // ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.only(left:30.0),
                child: Text(
                  text,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: const Color.fromARGB(255, 12, 12, 12),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:28.0),
                child: Text(subtext,
                style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.only(left:28.0),
                child: Text("Team",style: TextStyle(fontWeight: FontWeight.w900),),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:28.0),
                    child: FlutterImageStack(imageList:const  [
                      "assets/img/priyesh.png",
                      "assets/img/4202105160650431621171243.jpg",
                      "assets/img/dummy-profile.png",
                      "assets/img/Sam+Breitmeyer.jpg",
                      
                    ],
                     totalCount: 5,
                     backgroundColor: const Color.fromARGB(255, 221, 193, 151),
                     itemBorderColor:const Color.fromARGB(255, 221, 193, 151),
                                   extraCountTextStyle:TextStyle(color: Colors.white,fontSize:10 ),
                                   itemRadius:35,
                                   showTotalCount:true,
                              
                     ),
                  ),
                   Padding(
                     padding: const EdgeInsets.only(right:28.0),
                     child: CircularPercentIndicator(
                      radius: 60.0,
                      lineWidth: 15.0,
                      animation: true,
                                          animationDuration: 2000,
                               
                      percent: percentValue,
                      center: Text("${(percentValue * 100).toStringAsFixed(0)}%"),
                      progressColor: progressColor,
                                     ),
                   ),
            
                  
                ],
              ),
              Row(
                
                 children: [
          
                Padding(
                  padding: const EdgeInsets.only(left:8.0),
                  child: Icon(Icons.calendar_month_outlined,color: Colors.grey,),
                ),
              TextButton(
                onPressed: () => _selectDate(context, 1),
                child: Text(selectedDate1 != null ? DateFormat('MMMM d, y').format(selectedDate1!) : 'Select Date 1',style: TextStyle(color: Colors.grey),),
              ),
             // Text("-",style: TextStyle(color: Colors.grey),),
              TextButton(
                onPressed: () => _selectDate(context, 2),
                child: Text(selectedDate2 != null ? DateFormat('MMMM d, y').format(selectedDate2!) : 'Select Date 2',style: TextStyle(color: Colors.grey),),
              ),
              ],) 
            ],
          ),
        ),
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