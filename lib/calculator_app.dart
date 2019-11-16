import 'package:addierer_extended/home_page.dart';
import 'package:flutter/material.dart';

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('CalculatorApp::build');
    return MaterialApp(
      title: 'Flutter Learning App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}
