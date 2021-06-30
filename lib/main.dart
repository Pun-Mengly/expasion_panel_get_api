import 'package:expansion_panel/introduction/introduction_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ExpansionTileCard Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      // home: MyHomePage(title: 'ExpansionTileCard '),
      home: OnBoardingPage(),
    );
  }
}
