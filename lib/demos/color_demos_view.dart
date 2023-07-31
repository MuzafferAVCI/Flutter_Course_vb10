// ignore_for_file: unused_import

import 'dart:developer';

import 'package:flutter/material.dart';

class ColorDemosView extends StatefulWidget {
  const ColorDemosView({Key? key, required this.intialColor}) : super(key: key);
  final Color? intialColor;
  @override
  State<ColorDemosView> createState() => _ColorDemosViewState();
}

class _ColorDemosViewState extends State<ColorDemosView> {
  Color? _backGroundColor;

  @override
  void initState() {
    super.initState();
    _backGroundColor = widget.intialColor ?? Colors.transparent;
    //initialColor null gelırse transparent yap demek.
  }

  @override
  void didUpdateWidget(covariant ColorDemosView oldWidget) {
    super.didUpdateWidget(oldWidget);
    //inspect(widget);
    //inspect(widget) ==> aşagıda widget a nelerın geldıgını, degerlerını gormenı saglar.
    if (widget.intialColor != _backGroundColor && widget.intialColor != null) {
      changeBackgroundColor(widget.intialColor!);
    }
  }

  void changeBackgroundColor(Color color) {
    setState(() {
      _backGroundColor = color;
    });
    //Ekranın tetıklenmesını ıstıyorsan setState((){}) kullanmalısın.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backGroundColor,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _colorOnTap,
        items: const [
          BottomNavigationBarItem(icon: _ColorContainer(color: Colors.red), label: 'Red'),
          BottomNavigationBarItem(
              icon: _ColorContainer(
                color: Colors.yellow,
              ),
              label: 'Yellow'),
          BottomNavigationBarItem(icon: _ColorContainer(color: Colors.blue), label: 'blue')
        ],
      ),
    );
  }

  void _colorOnTap(int value) {
    if (value == _MyColors.red.index) {
      changeBackgroundColor(Colors.red);
    } else if (value == _MyColors.yellow.index) {
      changeBackgroundColor(Colors.yellow);
    } else if (value == _MyColors.blue.index) {
      changeBackgroundColor(Colors.blue);
    }
  }
}

enum _MyColors { red, yellow, blue }
//Numaralandırma sınıfı oluşturduk.

class _ColorContainer extends StatelessWidget {
  const _ColorContainer({
    Key? key,
    required this.color,
  }) : super(key: key);
  final Color color;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 10,
      height: 10,
    );
  }
}
