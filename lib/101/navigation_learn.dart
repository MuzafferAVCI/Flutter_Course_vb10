import 'package:flutter/material.dart';

import 'image_learn.dart';
import 'navigate_detail_learn.dart';

class NavigationLearn extends StatefulWidget {
  const NavigationLearn({Key? key}) : super(key: key);

  @override
  State<NavigationLearn> createState() => _NavigationLearnState();
}

class _NavigationLearnState extends State<NavigationLearn> with NavigatorManager {
  List<int> selectedItems = [];

  void addSelected(int index, bool isAdd) {
    setState(() {
      isAdd ? selectedItems.add(index) : selectedItems.remove(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return TextButton(
            onPressed: () async {
              final response = await navigateToWidgetNormal<bool>(
                  context, NavigateDetailLearnDart(isOkey: selectedItems.contains(index)));
              //"isOkey" boolean'ını alarak placeHolder'ın önceden seçilmiş mi seçilmemiş mi
              // anlayıp ona göre button da değişikler yapmasının saglıyoruz.
              //"navigateToWidgetNormal<bool>" bununla ben bu adamdan(NavigateDetailLearnDart()) boolean bır gerı dönüş bekliyorum diyorum.
              //Dönen boolean'ı response'a eşitleyip devam ediyoruz.
              if (response is bool) {
                //Dönen boolean ise :
                addSelected(index, response);
                //Kacıncı placeHolder onaylandıysa onun ındex degerı index olarak döner.
                //Bu index'i itemBuilder bize saglıyor.
                //print(selectedItems);
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Placeholder(
                color: selectedItems.contains(index) ? Colors.green : Colors.red,
                //selectedItems index'i içeriyorsa rengi yeşil içermiyorsa krmızı yap dedik.
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.navigation_rounded),
        onPressed: () async {
          navigateToWidget(context, const ImageLearn());
        },
      ),
    );
  }
}

mixin NavigatorManager {
  //"mixin" constructorsız class demek. Bir nevi interface gibi.
  void navigateToWidget(BuildContext context, Widget widget) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) {
        return widget;
        //"push" metoduyla istediğim widgeta gitmemizi sağlıyor. navigator kullanarak.
      },
      fullscreenDialog: true,
      //"fullscreenDialog" ise asağıdan yukarıya cıkararak açıyor .
      //sankı bır ek sayfaymıs gıbı .
      settings: const RouteSettings(),
      //"RouteSettings()" bunun içinde arguement vererek herhangi bir şeyi
      // Bir sayfaya verebılıyoruz.(dynamic vs. olarak).
    ));
  }
}

Future<T?> navigateToWidgetNormal<T>(BuildContext context, Widget widget) {
  //Boolean alan ve navigate eden bir method.
  //Pop edılen degerı tamamlamak ıcın Future kullanılır.
  //Pop edilen bir şeyi almak için Future kullanmalısın.
  return Navigator.of(context).push<T>(MaterialPageRoute(
    //push<T> yan sayfadan sana bır data gelebılır ve sen bunu yakalayabılırsın demek
    //Burada da bız bu gelen datayı return edıyoruz.
    builder: (context) {
      return widget;
    },
    //fullscreenDialog: true,
    settings: const RouteSettings(),
  ));
}
