import 'package:flutter/material.dart';

import 'color_demos_view.dart';

class ColorLifeCycle extends StatefulWidget {
  const ColorLifeCycle({Key? key}) : super(key: key);

  @override
  State<ColorLifeCycle> createState() => _ColorLifeCycleState();
}

class _ColorLifeCycleState extends State<ColorLifeCycle> {
  Color? _backgroundColor;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [IconButton(onPressed: _changeBackground, icon: const Icon(Icons.clear))],
      ),
      body: Column(
        children: [
          const Spacer(),
          Expanded(
              child: ColorDemosView(
            intialColor: _backgroundColor,
            // intialColor: _backgroundColor ?? Colors.transparent => "??" null giderse sunu yap demek.
          ))
        ],
      ),
    );
  }

  void _changeBackground() {
    setState(() {
      _backgroundColor = Colors.pink;
    });
  }
}
