import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';


ValueNotifier<int> indexChangeNotifier = ValueNotifier(0);

class BottomNavigationWidget extends StatelessWidget {
  const BottomNavigationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: indexChangeNotifier,
      builder: (context, int newIndex, _) {
        return SizedBox(
          child: BottomNavigationBar(
            currentIndex: newIndex,
            onTap: (index) {
              indexChangeNotifier.value = index;
            },
            elevation: 0,
            type: BottomNavigationBarType.fixed,
           // backgroundColor: Color.fromARGB(255, 240, 241, 240),
           backgroundColor: Colors.transparent,
            selectedItemColor: Color.fromARGB(255, 148, 144, 208),
            unselectedItemColor: Colors.grey,
            selectedIconTheme: const IconThemeData(
              color:Color.fromARGB(255, 148, 144, 208),
            ),
            unselectedIconTheme: const IconThemeData(
              color: Colors.grey,
            ),
            iconSize: 26,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_sharp,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.description_rounded),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.mail,
                ),
                label: "",
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings,
                ),
                label: "",
              ),
            ],
          ),
        );
      },
    );
  }
}
