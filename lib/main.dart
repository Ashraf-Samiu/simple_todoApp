import 'package:flutter/material.dart';
import 'package:simple_todoapp/home_screen.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      debugShowCheckedModeBanner: false,
      title: "Todo App",
      home: HomeScreen(),
    );
  }
}
