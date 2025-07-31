class CalculatorLogic {
  static String calculate(String left, String op, String right) {
    double num1 = double.tryParse(left) ?? 0;
    double num2 = double.tryParse(right) ?? 0;
    double result = 0;

    switch (op) {
      case '+':
        result = num1 + num2;
        break;
      case '-':
        result = num1 - num2;
        break;
      case '*':
        result = num1 * num2;
        break;
      case '/':
        result = num2 != 0 ? num1 / num2 : 0;
        break;
    }

    return result.toString();
  }
}