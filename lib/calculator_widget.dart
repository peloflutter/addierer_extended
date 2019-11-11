import 'package:addierer_extended/calculator_inherited_widget.dart';
import 'package:addierer_extended/number_input_widget.dart';
import 'package:addierer_extended/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorWidget extends StatefulWidget {
  CalculatorWidget({
    Key key,
    @required this.child,
  }) : super(key: key) {
    debugPrint("c'tor CalculatorWidget");
  }

  final Widget child;

  static CalculatorWidgetState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(CalculatorInheritedWidget)
            as CalculatorInheritedWidget)
        .data;
  }

  @override
  CalculatorWidgetState createState() => CalculatorWidgetState();
}

class CalculatorWidgetState extends State<CalculatorWidget> {
  // operation state managed by this state object
  OperationModel model;

  @override
  void initState() {
    debugPrint('CalculatorWidgetState::initState');
    super.initState();

    model = OperationModel.zero();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('CalculatorWidgetState::build');
    return CalculatorInheritedWidget(
      data: this,
      child: widget.child,
    );
  }

  void setInput(OperandPosition position, text) {
    debugPrint('CalculatorWidgetState::setInput => $text [$position]');
    
    // no setState needed !!! don't want to rebuild my widget tree
    if (position == OperandPosition.firstOperand) {
      model.firstOperand = text;
    } else if (position == OperandPosition.secondOperand) {
      model.secondOperand = text;
    }
  }

  void add() {
    debugPrint('CalculatorWidgetState::add');

    String firstOperand = model.firstOperand;
    String secondOperand = model.secondOperand;
    String result =
        (double.parse(firstOperand) + double.parse(secondOperand)).toString();

    setState(() {
      model.operation = Operation.add;
      model.result = result;
    });
  }

  void clear() {
    debugPrint('CalculatorWidgetState::clear');

    setState(() {
      model.operation = Operation.clear;
      model.firstOperand = '';
      model.secondOperand = '';
      model.result = '';
    });
  }
}
