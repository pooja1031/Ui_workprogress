import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:ui/widgets/image_stack.dart';

class Home extends StatelessWidget {
  final List<Color> cardColors = [
    Colors.blue,
    Colors.green,
    Colors.red,
    Colors.orange,
  ];

  final List<String> cardTexts = [
    'In Progress',
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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: CircleAvatar(
            backgroundImage: AssetImage('assets/img/avatar.png'),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Color.fromARGB(255, 9, 9, 9),
              ),
              onPressed: () {},
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Hello"),
                Text(
                  "Alex Macroni",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard(cardColors[0], cardIcons[0], cardTexts[0]),
                    _buildCard(cardColors[1], cardIcons[1], cardTexts[1]),
                  ],
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildCard(cardColors[2], cardIcons[2], cardTexts[2]),
                    _buildCard(cardColors[3], cardIcons[3], cardTexts[3]),
                  ],
                ),
               // SizedBox(height: 10),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check_circle_outline_outlined, color: Colors.grey, size: 40),
                  ),
                  title: Text("App Animation",style: TextStyle(fontSize: 15),),
                 
                  trailing: ImageStack(
                    imageList: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/360_F_370290384_K0VEqnA7kgxmabRn0QXiyBCbCyPGWNeh.jpg'),
                        radius: 15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/4202105160650431621171243.jpg'),
                        radius: 15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/dummy-profile.png'),
                        radius: 15,
                      ),
                    ],
                    totalRadius: 10,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
          
    
          Row(children: [
                   Padding(
                    padding: const EdgeInsets.only( left:78,),
                    child: LinearPercentIndicator(
                      width: 170.0,
                        animation: true,
                        animationDuration: 1000,
                        lineHeight: 12.0,
                        percent: 0.6,
                       linearStrokeCap: LinearStrokeCap.butt,
                        progressColor:  Color.fromARGB(255, 148, 144, 208),
                        barRadius: Radius.circular(10),
                    ),
                  ),],),
          SizedBox(height: 20,),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check_circle, color:  Color.fromARGB(255, 151, 215, 140), size: 40),
                  ),
                  title: Text("App Animation",style: TextStyle(fontSize: 15),),
                 
    
                  trailing: ImageStack(
                    imageList: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/360_F_370290384_K0VEqnA7kgxmabRn0QXiyBCbCyPGWNeh.jpg'),
                        radius: 15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/4202105160650431621171243.jpg'),
                        radius: 15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/dummy-profile.png'),
                        radius: 15,
                      ),
                    ],
                    totalRadius: 10,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
    
                Row(children: [
                   Padding(
                    padding: const EdgeInsets.only( left:78,),
                    child: LinearPercentIndicator(
                      width: 170.0,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 12.0,
                      percent: 1.0,
                      linearStrokeCap: LinearStrokeCap.butt,
                      progressColor: Color.fromARGB(255, 151, 215, 140),
                      barRadius: Radius.circular(10),
                    ),
                  ),],),
               SizedBox(height: 20),
                ListTile(
                  leading: IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.check_circle_outline_outlined, color: Colors.grey, size: 40),
                  ),
                  title: Text("App Animation",style: TextStyle(fontSize: 15),),
                  
                  trailing: ImageStack(
                    imageList: [
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/360_F_370290384_K0VEqnA7kgxmabRn0QXiyBCbCyPGWNeh.jpg'),
                        radius: 15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/4202105160650431621171243.jpg'),
                        radius: 15,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/img/dummy-profile.png'),
                        radius: 15,
                      ),
                    ],
                    totalRadius: 10,
                    trailingIcon: Icons.arrow_forward_ios,
                  ),
                ),
    
    Row(children: [Padding(
                    padding: const EdgeInsets.only( left:78,),
                    child: LinearPercentIndicator(
                      width: 170.0,
                      animation: true,
                      animationDuration: 1000,
                      lineHeight: 12.0,
                      percent: 0.3,
                      linearStrokeCap: LinearStrokeCap.butt,
                      progressColor: const Color.fromARGB(255, 208, 144, 139),
                      barRadius: Radius.circular(10),
                    ),
                  ),],)
                
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(Color color, IconData icon, String text) {
    return Expanded(
      child: Card(
        elevation: 3,
        color: color,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 48,
                color: Colors.white,
              ),
              SizedBox(height: 10),
              Text(
                text,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
