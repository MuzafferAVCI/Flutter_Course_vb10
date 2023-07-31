import 'package:flutter/material.dart';

class PaddingLearn extends StatelessWidget {
  const PaddingLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: ProjectPadding.pagePaddingVertical,
        //bu şekilde yaparak asagıda herbırı ıcın tek tek yazmana gerek kalmıyor
        //bu hepsıne aynı paddıng ıslemını uygular.
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
              child: Container(
                // Kendı ıcerısınde de paddıng uygulayabılırsın.
                padding: EdgeInsets.all(10),
                color: Colors.white,
                height: 100,
              ),
            ),
            Padding(
              //Bu şekilde iki faklı paddıngı bırleştırebılıyoruz.
              padding: ProjectPadding.pagePaddingOnlyRight +
                  ProjectPadding.pagePaddingVertical,
              child: Text('Ahmet'),
            ),
          ],
        ),
      ),
    );
  }
}

class ProjectPadding {
  static final pagePaddingVertical = const EdgeInsets.symmetric(vertical: 10);
  static final pagePaddingOnlyRight = const EdgeInsets.only(right: 10);
}
