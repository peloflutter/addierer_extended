import 'package:addierer_extended/calculator_widget.dart';
import 'package:flutter/cupertino.dart';

class CalculatorInheritedWidget extends InheritedWidget {
  final CalculatorWidgetState data;

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
