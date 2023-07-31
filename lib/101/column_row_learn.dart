import 'package:flutter/material.dart';

class ColumnRowLearn extends StatelessWidget {
  const ColumnRowLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Expanded(
                flex: 4,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        color: Colors.red,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.green,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.orange,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Colors.deepPurple,
                      ),
                    ),
                  ],
                )),
            Spacer(
              flex: 2,
            ), //spacer() bosluk atmaya yarıyor.
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.end,
                //Aralarında bosluklarla yazmaya yarıyor.
                mainAxisSize: MainAxisSize.min,
                //MainAxisSize.min yaparak aralarında minimum bosluk bırakarak yap demek.
                children: [
                  Text('a1'),
                  Text('a2'),
                  Text('a3'),
                ],
              ),
            ),
            SizedBox(
              height: ProjectContainerSizes.cardHeight,
              child: Column(
                children: [
                  Expanded(child: Text('data')),
                  Expanded(child: Text('data')),
                  Expanded(child: Text('data')),
                  Spacer(),
                  Expanded(child: Text('data')),
                ],
              ),
            ),
          ],
//Flex'te  yüzdelik oranlarına göre oranlamamızı saglar.
          //expanded() hepsini eşit parçaya bölerek diziyor.
        ));
  }
}

class ProjectContainerSizes {
  static const double cardHeight = 200;
}
