import 'package:flutter/material.dart';

class ButtonLearn extends StatelessWidget {
  const ButtonLearn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          TextButton(
            child: Text('SAVE', style: Theme.of(context).textTheme.subtitle1),
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),
            onPressed: () {},
          ),
          ElevatedButton(
              onPressed:
                  null, //istersek buttonu disabled da yapabılırız  onPressed bolumunu 'null' yaparak.
              child: Text(
                  'data')), //BackGround ı olan Textbutton, Ayrıyaten ıstedıgın gıbı custom edebılırsın
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.abc_rounded)), //Basınca yuvarlak desen cıkarıyor
          FloatingActionButton(
              onPressed: () {
                //servise istek at
                //sayfanın rengını duzenle
                //gibi buttona basılınca neler yapmasını ıstıyorsak onu buraya yazıyoruz.
              },
              child: Icon(Icons
                  .add)), //'add' iconunu ekledım; farklı icon desenlerı var (en cok kullanacagımız buttonlardan birisi)
          OutlinedButton(
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.all(10),
                //shape: CircleBorder() "bu kodla şeklini ayarlayabılıyoruz"
              ), //style: deyıp dırekt stilini belirleyebılıyorsun.
              onPressed: () {},
              child: SizedBox(
                  width: 200,
                  child: Text(
                      'data'))), // içi boş sadeece etrafı cızılmıs button olusturur.
          InkWell(
            onTap: () {},
            child: Text('Custom'),
          ), //İstediğin bir text'e button özelliği verır.
          Container(
            height: 100,
            color: Colors.white,
          ),
          SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              'Place Bid',
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
//Borders:
//CircleBorder(),RoundedRectangleBorder()
