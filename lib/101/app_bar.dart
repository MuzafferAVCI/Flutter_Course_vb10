import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarView extends StatelessWidget {
  const AppBarView({Key? key}) : super(key: key);
  final String title = 'Welcome Learn';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: Text(title),
      leading: const Icon(Icons.chevron_left),
      //yukarıya gerı tusu konuldu
      centerTitle: true,
      //Welcome yazısı ortalandı
      backgroundColor: Colors.transparent,
      //AppBar ın arka plan rengı sefaf koyu yapıldı
      elevation: 0,
      //yukarıdakı welcome yazısının kutucugunu belırsızlestırıyor.
      systemOverlayStyle: SystemUiOverlayStyle.light,
      //Yukarıdakı saat gostergelerının renklerı wıfı falan da dahıl
      toolbarTextStyle: const TextStyle(color: Colors.white),

      automaticallyImplyLeading: false,
      //sayfada otomatık olarak bet(yukarıdakı Gerı tusundan bahsedıyor) buttonu gelmesın demek.
      leadingWidth: 60,
      //yukarıdakı gerı tusunun sag sola gıtmesını saglar.(Verdıgın degere gore degısır.)
      actionsIconTheme: const IconThemeData(color: Colors.orange, size: 30),
      //yukarıdakı actıonIcon ın (sag usttekı mektup butonu) renklerını ayarlamayı saglar.
      actions: [
        //sag ust taraftakıler
        IconButton(
          onPressed: (() {}),
          icon: const Icon(Icons.mark_email_unread_sharp),
        ),
        //sag ust tarafta mektup ısaretı koyduk basılabılır
        const Center(child: CircularProgressIndicator())
        // yuklenıyor görüntüsü koyduk
      ],
    ));
  }
}
