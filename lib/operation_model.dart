// data class
enum Operation { none, add, clear }

class OperationModel {
  String firstOperand;
  String secondOperand;
  String result;
  Operation operation;

  OperationModel(this.firstOperand, this.secondOperand, this.result);

  OperationModel.zero() {
    firstOperand = '';
    secondOperand = '';
    result = '';
    operation = Operation.none;
  }

  @override
  bool operator ==(o) =>
      o is OperationModel &&
      o.firstOperand == firstOperand &&
      o.secondOperand == secondOperand &&
      o.result == result &&
      o.operation == operation;

  @override
  int get hashCode =>
      firstOperand.hashCode ^
      secondOperand.hashCode ^
      result.hashCode ^
      operation.hashCode;

  @override
  String toString() {
    return 'FirstOperand: $firstOperand - SecondOperand: $secondOperand - Result: $result [Operation = $operation]';
  }
}
