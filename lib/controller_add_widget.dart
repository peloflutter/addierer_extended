import 'package:addierer_extended/calculator_state_container.dart';
import 'package:flutter/material.dart';

class ControllerAddWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    debugPrint('ControllerAddWidget::build');
    final CalculatorStateContainerState state = CalculatorStateContainer.of(context, false);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        child: Text('Add'),
        onPressed: () {
          state.add();
        },
      ),
    );
  }
}
