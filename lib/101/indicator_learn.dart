import 'package:flutter/material.dart';

class IndicatorLearn extends StatelessWidget {
  const IndicatorLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [CenteredCircularProgress()],
        ),
        body: LinearProgressIndicator());
  }
}

class CenteredCircularProgress extends StatelessWidget {
  const CenteredCircularProgress({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: CircularProgressIndicator(
      strokeWidth: 8,
      //kalınlıgını ayarlamanı saglar.
      //value: 0.5,
      //istedigin oranda durdurarak bunlarla bı anımasyon yapabılırsın
      backgroundColor: Colors.red,
      //arka plan rengını ayarlamanı saglar.
    ));
  }
}
