import 'package:flutter/material.dart';

import '../core/random_image.dart';

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final _cardHeight = 50.0;
  final _cardWidth = 200.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              //yüzde kaçını kaplamasını istediğini yazmana yardımcı olur.
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill(
                    child: const RandomImage(),
                    bottom: _cardHeight / 2,
                  ),
                  Positioned(width: _cardWidth, bottom: 0, height: _cardHeight, child: _cardCustom())
                  //positioned.fill() diyerek tam olarak kaplamasını soyledık.
                ],
              )),
          const Spacer(
            flex: 6,
          )
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
