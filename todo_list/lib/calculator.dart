import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  _CalculatorScreenState createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _currentNumber = '';
  double _num1 = 0.0;
  double _num2 = 0.0;
  String _operation = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _currentNumber = '';
      _num1 = 0.0;
      _num2 = 0.0;
      _operation = '';
    } else if (buttonText == '+' ||
        buttonText == '-' ||
        buttonText == 'x' ||
        buttonText == '/') {
      _num1 = double.parse(_currentNumber);
      _operation = buttonText;
      _currentNumber = '';
    } else if (buttonText == '.') {
      if (_currentNumber.contains('.')) {
        return;
      } else {
        _currentNumber = _currentNumber + buttonText;
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_currentNumber);
      if (_operation == '+') {
        _output = (_num1 + _num2).toString();
      } else if (_operation == '-') {
        _output = (_num1 - _num2).toString();
      } else if (_operation == 'x') {
        _output = (_num1 * _num2).toString();
      } else if (_operation == '/') {
        _output = (_num1 / _num2).toString();
      }
      _num1 = 0.0;
      _num2 = 0.0;
      _currentNumber = '';
      _operation = '';
    } else {
      _currentNumber = _currentNumber + buttonText;
    }

    setState(() {
      _output = double.parse(_output).toStringAsFixed(2);
    });
  }

  Widget _buildButton(String buttonText, Color buttonColor, Color textColor) {
    return Expanded(
      child: RaisedButton(
        onPressed: () => _buttonPressed(buttonText),
        color: buttonColor,
        textColor: textColor,
        padding: const EdgeInsets.all(24),
        child: Text(
          buttonText,
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Calculator'),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 12),
            child: Text(
              _output,
              style: TextStyle(fontSize: 48),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('7', Colors.grey.shade300, Colors.black),
              _buildButton('8', Colors.grey.shade300, Colors.black),
              _buildButton('9', Colors.grey.shade300, Colors.black),
              _buildButton('/', Colors.blue, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('5', Colors.grey.shade300, Colors.black),
              _buildButton('4', Colors.grey.shade300, Colors.black),
              _buildButton('6', Colors.grey.shade300, Colors.black),
              _buildButton('*', Colors.blue, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('1', Colors.grey.shade300, Colors.black),
              _buildButton('2', Colors.grey.shade300, Colors.black),
              _buildButton('3', Colors.grey.shade300, Colors.black),
              _buildButton('-', Colors.blue, Colors.white),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _buildButton('0', Colors.grey.shade300, Colors.black),
              _buildButton('.', Colors.grey.shade300, Colors.black),
              _buildButton('00', Colors.grey.shade300, Colors.black),
              _buildButton('+', Colors.blue, Colors.white),
            ],
          )
        ])));
  }
}
