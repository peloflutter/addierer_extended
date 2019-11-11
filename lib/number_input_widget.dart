import 'package:addierer_extended/calculator_widget.dart';
import 'package:addierer_extended/operation_model.dart';
import 'package:flutter/material.dart';

enum OperandPosition { firstOperand, secondOperand }

class NumberInputWidget extends StatelessWidget {
  final OperandPosition position;

  NumberInputWidget({@required this.position}) {
    debugPrint("c'tor NumberInputWidget [${this.position}]");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('NumberInputWidgetState::build');

    String header = (position == OperandPosition.firstOperand)
        ? '1. Operand'
        : '2. Operand';

    final CalculatorWidgetState state = CalculatorWidget.of(context, true);

    Key key = (state.model.operation == Operation.clear) ? UniqueKey() : null;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            header,
            style: TextStyle(fontSize: 24),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
          child: TextField(
            style: TextStyle(fontSize: 20),
            key: key,
            keyboardType: TextInputType.number,
            onChanged: (String text) {
              state.setInput(position, text);
            },
          ),
        ),
      ],
    );
  }
}
