import 'package:flutter/material.dart';

class StatelessLearn extends StatelessWidget {
  //StatelessWidget ın amacı data alıp data verıcem mantıgında
  //yanı herhangı bır anımatıon olmayacak veya baska bır şey.
  //Sadece gosterı amaclı kullanım var
  @override
  Widget build(BuildContext context) {
    final String text2 = 'veli';
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TitleTextWidget(
            text: text2,
          ),
          _emptyBox(),
          TitleTextWidget(
            text: 'veli2',
          ),
          _emptyBox(),
          TitleTextWidget(
            text: 'veli3',
          ),
          _emptyBox(),
          TitleTextWidget(
            text: 'veli4',
          ),
          _emptyBox(),
          //Bu yazacakların için tek tek ugrasma bır wıdget ıcerısınde tut ve oradan kullan.
          //Bu dogru kullanım şekli uygulanmış hali.

          _CustomContainer(),
          _emptyBox(),
        ],
      ),
    );
  }

  SizedBox _emptyBox() => SizedBox(
        height: 10,
      );
}

class _CustomContainer extends StatelessWidget {
  // CustomContainer deki basına koydugumuz "_" bu işaret
  //sadece bu dosyaya özel oldugunu belırtmek için kullanılır.
  const _CustomContainer({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red,
      ),
    );
  }
}

class TitleTextWidget extends StatelessWidget {
  const TitleTextWidget({Key? key, required this.text}) : super(key: key);
  final String text;
  //final String? text;  'required degilse' böyle kullan.
  //Bu dısarıdan bır 'text' adında bır data gelecek ama gelmeyedebılır anlamına gelır.
  //ama illaki bır data gelmesı gerekıyorsa "required this.text" şeklinde yazman gerek.
  //
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.headline3,
    );
  }
}
