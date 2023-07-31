import 'package:flutter/material.dart';

class StackLearn extends StatelessWidget {
  const StackLearn({Key? key}) : super(key: key);

//Bir yerde üst üste binme varsa orada stack kullanılmalı.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          /*Container(
            color: Colors.red,
            height: 100,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Container(
              color: Colors.blue,
              height: 100,
            ),
          ),*/

          //Hangisinin öne cıkması ıstıyorsan onu alt tarafta yaz.
          Positioned.fill(
              top: 20,
              child: Container(
                color: Colors.yellow,
              )),
          Positioned(
              bottom: 0,
              width: 100,
              height: 100,
              child: Container(
                color: Colors.green,
              )),
        ],
      ),
    );
  }
}
