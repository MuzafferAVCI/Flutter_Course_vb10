import 'package:flutter/material.dart';
import 'package:flutter_full_learn2/101/stack_learn.dart';

import 'icon_learn.dart';
import 'image_learn.dart';

class PageViewLearn extends StatefulWidget {
  const PageViewLearn({Key? key}) : super(key: key);

  @override
  State<PageViewLearn> createState() => _PageViewLearnState();
}

class _PageViewLearnState extends State<PageViewLearn> {
  final _pageController = PageController(viewportFraction: 0.7);

  int _currentPageIndex = 0;
  void _updatePageIndex(int index) {
    setState(() {
      _currentPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                _currentPageIndex.toString(),
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            const Spacer(),
            FloatingActionButton(
              onPressed: () {
                _pageController.previousPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
              },
              child: const Icon(Icons.chevron_left),
            ),
            FloatingActionButton(
              onPressed: () {
                _pageController.nextPage(duration: _DurationUtility._durationLow, curve: Curves.slowMiddle);
              },
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
        appBar: AppBar(),
        body: PageView(
          //Yan yana sayfalar eklemenı saglar.
          //sımulatorde ekranı yana kaydırırsan gorursun.

          padEnds: false, //sayfaların ortadan degılde bastan baslamasını saglar "false" verırsen.
          controller: _pageController,
          //diğer sayfanın küçük bir önizlemesini gösteriyor; sayfanın bir kısmının gösteriyor.
          onPageChanged: _updatePageIndex,
          children: [
            const ImageLearn(),
            IconLearnView(),
            const StackLearn(),
            Container(color: Colors.blue),
            Container(color: Colors.green),
          ],
        ));
  }
}

class _DurationUtility {
  static const _durationLow = Duration(milliseconds: 500);
}
