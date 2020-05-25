import 'package:flutter/material.dart';

import 'screens/home.dart';
//import 'screens/photo_screen.dart';

class MyApp extends StatelessWidget {

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home()//Feed()//FullScreenImage()
    );
  }
}

