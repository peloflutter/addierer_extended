import 'package:addierer_extended/calculator_state_container.dart';
import 'package:addierer_extended/operation_model.dart';
import 'package:flutter/material.dart';

enum OperandPosition { firstOperand, secondOperand }

class NumberInputWidget2 extends StatefulWidget {
  final OperandPosition position;

  NumberInputWidget2({@required this.position}) {
    debugPrint("c'tor NumberInputWidget2 [${this.position}]");
  }

  @override
  _NumberInputWidget2State createState() => _NumberInputWidget2State();
}

class _NumberInputWidget2State extends State<NumberInputWidget2> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint('_NumberInputWidget2State::build');

    String header = (widget.position == OperandPosition.firstOperand)
        ? '1. Operand'
        : '2. Operand';

    final CalculatorStateContainerState state =
        CalculatorStateContainer.of(context, true);

    if (state.model.operation == Operation.clear) {
      controller.clear();
    }

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
            controller: controller,
            style: TextStyle(fontSize: 20),
            keyboardType: TextInputType.number,
            onChanged: (String text) {
              state.setInput(widget.position, controller.text);
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
