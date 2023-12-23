import 'package:flutter/material.dart';
import 'package:ui/screens/home.dart';
import 'package:ui/screens/message.dart';
import 'package:ui/screens/projects.dart';
import 'package:ui/screens/setting.dart';
import 'package:ui/widgets/bottomnav.dart';

class ScreenMainPage extends StatefulWidget {
  const ScreenMainPage({Key? key}) : super(key: key);

  @override
  State<ScreenMainPage> createState() => _ScreenMainPageState();
}

class _ScreenMainPageState extends State<ScreenMainPage> {
  final _pages = [
    Home(),
    Projects(),
    Message(),
settings() , ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        valueListenable: indexChangeNotifier,
        builder: (context, int index, _) {
          return _pages[index];
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromARGB(255, 148, 144, 208),
        onPressed: () {},
        tooltip: "Increment",
        child: Icon(Icons.add),
                mini: true, 

         shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0), 
        )
      ),
      bottomNavigationBar: 
      BottomAppBar(
        shape: CircularNotchedRectangle(), 
        height: 86,
        elevation: 3,
        shadowColor: Colors.black,
        notchMargin: 1.0, 
        child:
         BottomNavigationWidget(),
      ),
   );
  }
}
