import 'package:addierer_extended/calculator_state_container.dart';
import 'package:flutter/cupertino.dart';

class CalculatorInheritedWidget extends InheritedWidget {
  final CalculatorStateContainerState data;

  CalculatorInheritedWidget({
    Key key,
    @required Widget child,
    @required this.data,
  }) : super(key: key, child: child) {
    debugPrint("c'tor CalculatorInheritedWidget");
  }

  @override
  bool updateShouldNotify(CalculatorInheritedWidget oldWidget) {
    debugPrint("CalculatorInheritedWidget::updateShouldNotify");
    return true;
  }
}
