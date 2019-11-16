import 'package:addierer_extended/calculator_state_container.dart';
import 'package:addierer_extended/operation_model.dart';
import 'package:flutter/material.dart';

enum OperandPosition { firstOperand, secondOperand }

class NumberInputWidget extends StatefulWidget {
  final OperandPosition position;

  NumberInputWidget({@required this.position}) {
    debugPrint("c'tor NumberInputWidget [${this.position}]");
  }

  @override
  _NumberInputWidgetState createState() => _NumberInputWidgetState();
}

class _NumberInputWidgetState extends State<NumberInputWidget> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    debugPrint('_NumberInputWidgetState::build');

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
