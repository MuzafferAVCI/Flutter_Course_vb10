import 'package:flutter/material.dart';

class ColorLearn extends StatelessWidget {
  const ColorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
              child: Text(
            'data',
            style: Theme.of(context)
                .textTheme
                .subtitle1
                ?.copyWith(color: Theme.of(context).errorColor),
          )),
          //Theme dekı errorColor'ı ıstedıgım gıbı degıstırmıstım ve onu burada kullandım.
        ],
      ),
    );
  }
}

class ColorsItems {
  static final Color sulu = Color(0xff9DED61);
  static final Color mandy = Color.fromRGBO(237, 97, 110, 1);
}
