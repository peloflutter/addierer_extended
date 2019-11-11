import 'package:addierer_extended/calculator_widget.dart';
import 'package:addierer_extended/home_page_widget.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('MyApp::build');
    return CalculatorWidget(
      child: MaterialApp(
        title: 'Another Very Simple Calculator',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}
