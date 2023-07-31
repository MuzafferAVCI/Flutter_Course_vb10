import 'package:flutter/material.dart';

import '../core/random_image.dart';

class ListTileLearn extends StatelessWidget {
  const ListTileLearn({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: ListTile(
                  title: const RandomImage(
                    height: 100,
                  ),
                  dense: true,
                  //dense: olabıldıgınce sıkıstırmayı saglıyor.
                  minVerticalPadding: 0,
                  onTap: () {},
                  //Ne ıslem yapacagını buraya yazıyorsun
                  subtitle: const Text('How do you use card'),
                  leading: Container(
                      //sol tarafı leadıng oluyor.
                      color: Colors.red,
                      //rengını sadece ne kadar yer kapladıgını gorebılmek ıcın yaptık.
                      height: 100,
                      width: 20,
                      alignment: Alignment.bottomCenter,
                      //leadıngı asagı yukarı hareket ettırme taktıgı
                      child: const Icon(Icons.money)),
                  //Bunun sol tarafına bır sey koymak ıcın bu 'leading' i kullanabılırsın
                  trailing: const Icon(Icons.chevron_right),
                  //sag tarafına bır sey koymak ısterken bunu kullanırsın
                ),
              ),
            )
          ],
        ));
  }
}
