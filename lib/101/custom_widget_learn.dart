import 'package:flutter/material.dart';

class CustomWidgetLearn extends StatelessWidget {
  const CustomWidgetLearn({Key? key}) : super(key: key);
  final String _title = 'food';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Center(
              child: Padding(
            padding: _PaddingUtility().horizontalPadding,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CustomFoodButton(
                text: _title,
                onPressed: (() {}),
              ),
            ),
          )),
          const SizedBox(
            height: 100,
          ),
          CustomFoodButton(
            text: _title,
            onPressed: (() {}),
          )
        ]));
  }
}

mixin class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
}

mixin class _PaddingUtility {
  final EdgeInsets normalPadding = const EdgeInsets.all(8.0);
  final EdgeInsets normal2xPadding = const EdgeInsets.all(16.0);
  final EdgeInsets horizontalPadding = const EdgeInsets.symmetric(horizontal: 20);
}

class CustomFoodButton extends StatelessWidget with _ColorsUtility, _PaddingUtility {
  CustomFoodButton({Key? key, required this.text, required this.onPressed}) : super(key: key);
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
        onPressed: onPressed,
        child: Padding(
          padding: normal2xPadding,
          child: Text(text,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(color: whiteColor, fontWeight: FontWeight.bold)),
        ));
  }
}
