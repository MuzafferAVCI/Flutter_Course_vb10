// ignore_for_file: unused_import

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_full_learn2/202/theme/light_theme.dart';

import '101/app_bar.dart';
import '101/card_learn.dart';
import '101/color_learn.dart';
import '101/column_row_learn.dart';
import '101/custom_widget_learn.dart';
import '101/icon_learn.dart';
import '101/image_learn.dart';
import '101/indicator_learn.dart';
import '101/list_tile_learn.dart';
import '101/list_view_builder.dart';
import '101/list_view_learn.dart';
import '101/navigation_learn.dart';
import '101/padding_learn.dart';
import '101/page_view_learn.dart';
import '101/scaffold_learn.dart';
import '101/stack_learn.dart';
import '101/statefull_learn.dart';
import '101/statefull_life_cycle_learn.dart';
import '101/stateless_learn.dart';
import '101/text_field_learn.dart';
import '202/animated_learn_view.dart';
import '202/cache/shared_learn_cache.dart';
import '202/cache/shared_list_cache.dart';
import '202/form_learn_view.dart';
import '202/image_learn_202.dart';
import '202/model_learn_view.dart';
import '202/oop_learn_view.dart';
import '202/package/loading_bar.dart';
import '202/package_learn_view.dart';
import '202/service/post_service.dart';
import '202/service/service_learn_view.dart';
import '202/service/service_post_learn_view.dart';
import '202/tab_learn.dart';
import '202/theme_learn_view.dart';
import 'demos/color_demos_view.dart';
import 'demos/color_life_cycle_view.dart';
import 'demos/my_collections_demos.dart';
import 'demos/note_demos_app.dart';
import 'demos/stack_demo_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //CupertinoApp daha cok ios tasarımının oldugu bır yaklasım.
      title: 'Flutter Demo',
      theme: LightTheme().theme,

      /*
      ThemeData.dark().copyWith(
          tabBarTheme: const TabBarTheme(
              labelColor: Colors.yellowAccent,
              unselectedLabelColor: Colors.grey,
              indicatorSize: TabBarIndicatorSize.label),
          bottomAppBarTheme: const BottomAppBarTheme(shape: CircularNotchedRectangle()),
          cardTheme: CardTheme(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))),
          listTileTheme: const ListTileThemeData(contentPadding: EdgeInsets.zero),
          progressIndicatorTheme: const ProgressIndicatorThemeData(color: Colors.white),
          colorScheme: ColorScheme.dark(error: ColorsItems.mandy),
          //errorColor: ColorsItems.mandy,
          //Sadece bu theme dekı errorColor ı değiştirdim ama başka bır temada boyle olmayacak.
          inputDecorationTheme: const InputDecorationTheme(
              filled: true,
              labelStyle: TextStyle(color: Colors.lime),
              fillColor: Colors.white,
              iconColor: Colors.red,
              border: OutlineInputBorder(),
              floatingLabelStyle: TextStyle(color: Colors.red, fontSize: 24, fontWeight: FontWeight.w600)),
          textTheme: const TextTheme(titleMedium: TextStyle(color: Colors.red)),
          //Burada bütün subtitle1'leri kırmızı renk yaptık.
          appBarTheme: const AppBarTheme(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            //Welcome yazan yerın arka plan rengı sefaf koyu yapıldı
            elevation: 0,
            //yukarıdakı welcome yazısının kutucugunu belırsızlestırıyor.
            systemOverlayStyle: SystemUiOverlayStyle.light,

            //Buraya yazarak herbır sayafaya ayrı ayrı theme yazmaktansa burada bır standartta yazıp hepsınde bunları kullanmayı amaçladık yanı "Clean Coddıng"
          ))
          */
      home: const SharedListCache(),
    );
  }
}
