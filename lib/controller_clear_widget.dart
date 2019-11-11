import 'package:addierer_extended/calculator_widget.dart';
import 'package:flutter/material.dart';

class ControllerClearWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('ControllerClearWidget::build');
    final CalculatorWidgetState state = CalculatorWidget.of(context, false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text('Clear'),
        onPressed: () {
          state.clear();
        },
      ),
    );
  }
}
