import 'package:flutter/material.dart';

class IconLearnView extends StatelessWidget {
  IconLearnView({Key? key}) : super(key: key);
  final IconSize iconSize = IconSize();
  final IconColors iconColors = IconColors();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("hello World"),
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              size: iconSize.iconSmall,
              color: Theme.of(context).backgroundColor,
              //Rengını Theme uzerınden ayarlamak.
              //Theme uzerınden ayarlayınca bı degısıklıkte oradakı temaya gore rengını otomatık ayarlar.
              //Theme uzerınden yapmasaydık ıcon hep verdıgın renkte kalacaktı
              //Yanı suan dark tema kullanılıyor ama lıght temaya gecersek ıconun rengını lıght temaya gore uyarlayacaktı
              //Ama rengını kendın verırsen hep aynıno renkte kalacaktır.
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              size: iconSize.iconSmall,
              color: iconColors.Mandy,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.message_outlined,
              size: IconSize().iconSmall,
              color: iconColors.Mandy,
            ),
          ),
        ],
      ),
    );
  }
}

class IconSize {
  final double iconSmall = 40;
}

class IconColors {
  // ignore: non_constant_identifier_names
  final Color Mandy = const Color(0xffED616E);
}
