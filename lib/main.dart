import 'package:flutter/material.dart';
import 'package:ui/widgets/bottomnavigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation:0,
        ),
        colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 237, 234, 240)),
        useMaterial3: true,
      ),
      home: ScreenMainPage(),
    );
  }
}

