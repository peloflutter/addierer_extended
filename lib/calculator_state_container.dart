import 'package:addierer_extended/calculator_inherited_widget.dart';
import 'package:addierer_extended/number_input_widget.dart';
import 'package:addierer_extended/operation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CalculatorStateContainer extends StatefulWidget {
  final Widget child;

  CalculatorStateContainer({
    Key key,
    @required this.child,
  }) : super(key: key) {
    debugPrint("c'tor CalculatorStateContainer");
  }

  static CalculatorStateContainerState of(BuildContext context, bool rebuild) {
    CalculatorStateContainerState widget = (rebuild)
        ? (context.inheritFromWidgetOfExactType(CalculatorInheritedWidget)
                as CalculatorInheritedWidget)
            .data
        : (context.ancestorWidgetOfExactType(CalculatorInheritedWidget)
                as CalculatorInheritedWidget)
            .data;

    return widget;
  }

  @override
  CalculatorStateContainerState createState() =>
      CalculatorStateContainerState();
}

class CalculatorStateContainerState extends State<CalculatorStateContainer> {
  // operation state managed by this state object
  OperationModel model;

  @override
  void initState() {
    debugPrint('CalculatorStateContainerState::initState');
    super.initState();

    model = OperationModel.zero();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('CalculatorStateContainerState::build');
    return CalculatorInheritedWidget(
      data: this,
      child: widget.child,
    );
  }

  void setInput(OperandPosition position, text) {
    debugPrint('CalculatorStateContainerState::setInput => $text [$position]');

    // no setState needed !!! don't want to rebuild my widget tree
    if (position == OperandPosition.firstOperand) {
      model.firstOperand = text;
    } else if (position == OperandPosition.secondOperand) {
      model.secondOperand = text;
    }
  }

  void add() {
    debugPrint('CalculatorStateContainerState::add');

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
    debugPrint('CalculatorStateContainerState::clear');

    setState(() {
      model.operation = Operation.clear;
      model.firstOperand = '';
      model.secondOperand = '';
      model.result = '';
    });
  }
}
