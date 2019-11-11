import 'package:addierer_extended/calculator_widget.dart';
import 'package:flutter/cupertino.dart';

class NumberOutputWidget extends StatelessWidget {
  NumberOutputWidget() {
    debugPrint("c'tor NumberOutputWidget");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint('NumberOutputWidget::build');
    final CalculatorWidgetState state = CalculatorWidget.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
          child: Text(
            'Result:',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            state.model.result,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ],
    );
  }
}