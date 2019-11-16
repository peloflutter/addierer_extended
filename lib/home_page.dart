import 'package:addierer_extended/controller_add_widget.dart';
import 'package:addierer_extended/controller_clear_widget.dart';
import 'package:addierer_extended/horizontal_line_widget.dart';
import 'package:addierer_extended/number_input_widget2.dart';
import 'package:addierer_extended/number_output_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Adding two Numbers - Extended'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NumberInputWidget2(position: OperandPosition.firstOperand),
            NumberInputWidget2(position: OperandPosition.secondOperand),
            ControllerAddWidget(),
            NumberOutputWidget(),
            ControllerClearWidget(),
            HorizontalLineWidget(),
          ],
        ),
      ),
    );
  }
}
