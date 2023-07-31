import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  TextLearnView({Key? key, this.userName}) : super(key: key);
  final String name = 'veli';
  final String? userName;
  final projectKeys keys = projectKeys();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          ('Welcome $name ${name.length}'), //$ bu dolar işareti "'welcome' +name" ifadesi yerıne kullanılır yanı + gorevı gorur.
          //${name.length} ifadesını yapabılmek ıcın fonksıypnmus gıbı suslu parantez ıcıne almamız grekıyor
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
          //textScaleFactor: 1.8, //Baska devicelarda nasıl görünecegıne bakıyoruz. Ama bunu zaten flutter bunuın kendısı halledyor.
          style: Theme.of(context)
              .textTheme
              .headline5
              ?.copyWith(color: Color.fromARGB(255, 75, 221, 17)),
        ),
        Text(
          'Welcome $name ${name.length}',
          style: const TextStyle(
              wordSpacing: 2,
              decoration: TextDecoration.underline,
              fontStyle: FontStyle.italic,
              color: Colors.lime,
              letterSpacing: 2,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        Text(
          'Welcome $name ${name.length}',
          style: projectStyles.welcomeStyle,
        ),
        Text(keys.welcome),
        Text(userName ?? ''),
      ])),
    );
  }
}

class projectKeys {
  final String welcome = 'Merhaba';
}

class projectStyles {
  static TextStyle welcomeStyle = const TextStyle(
      wordSpacing: 2,
      decoration: TextDecoration.underline,
      fontStyle: FontStyle.italic,
      color: Colors.lime,
      letterSpacing: 2,
      fontSize: 16,
      fontWeight: FontWeight.w600);
}
