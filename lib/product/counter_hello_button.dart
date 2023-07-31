import 'package:flutter/material.dart';

import 'language/language_items.dart';

class CounterHelloButton extends StatefulWidget {
  const CounterHelloButton({Key? key}) : super(key: key);

  @override
  State<CounterHelloButton> createState() => _CounterHelloButtonState();
}

class _CounterHelloButtonState extends State<CounterHelloButton> {
  int _counterMerhaba = 0;
  final String _welcomeTitle = LanguageItems.welcomeTitle;
  void _updateCounter() {
    setState(() {
      ++_counterMerhaba;
    });
  }

  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: _updateCounter, child: Text('$_welcomeTitle  ($_counterMerhaba)'));
  }
}
