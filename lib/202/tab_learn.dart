import 'package:flutter/material.dart';

import '../101/icon_learn.dart';
import '../101/image_learn.dart';

class TabLearn extends StatefulWidget {
  const TabLearn({Key? key}) : super(key: key);

  @override
  State<TabLearn> createState() => _TabLearnState();
}

class _TabLearnState extends State<TabLearn> with TickerProviderStateMixin {
  late final TabController _tabController;
  //Bunun yapmazsak asagıdakı tablere basınca hiçbir şey olmuyor.
  final double _notcehdValue = 10;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _MyTabViews.values.length, vsync: this);
    //Bunun yapmazsak asagıdakı tablere basınca hiçbir şey olmuyor.
    //initState içerisinde yazmak gerekıyor.
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _MyTabViews.values.length,
        //tabBar'ın kac safyadan olustugunu yazdık.
        child: Scaffold(
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          //floatingActionButtonun yerını belırttık.
          floatingActionButton: FloatingActionButton(onPressed: () {
            _tabController.animateTo(_MyTabViews.home.index);
          }),
          extendBody: true,
          //Button'un arka tarafını sayfa rengiyle aynı yaptı.

          /*appBar: AppBar(
            bottom: TabBar(
                indicatorColor: Colors.white,
                labelColor: Colors.yellowAccent,
                unselectedLabelColor: Colors.grey,
                padding: EdgeInsets.zero,
                onTap: (value) {},
                controller: _tabController,
                tabs: const [
                  //appBar'ın alt tarafına page 1 ve page 2 diye 2 tane tab koyduk.
                  //Sırasını ıstedıgın gıbı koyabılırsın. Koydugun sıraya gore sıralanırlar.
                  //Ve o tablere basınca tabler arasında gecısını saglar.
                  Tab(text: 'page 1'),
                  Tab(text: 'page 2')
                ]),
          ),*/

          body: _tabbarView(),
          bottomNavigationBar: BottomAppBar(
            //Bu da alt tarafta olmasını ıstedıgınde yap.
            notchMargin: _notcehdValue,
            //Bu da gölgenin boyutunu belırlemenı saglar.
            shape: const CircularNotchedRectangle(),
            //button'ın oldugu yerın arka tarafında kesık oldu.
            child: _myTabView(),
            //Bana bu tab'i gönder ama liste yaparak.
          ),
        ));
  }

  TabBar _myTabView() {
    return TabBar(
        indicatorColor: Colors.white,
        padding: EdgeInsets.zero,
        onTap: (int index) {},
        controller: _tabController,
        tabs: _MyTabViews.values.map((e) => Tab(text: e.name)).toList());
  }

  TabBarView _tabbarView() {
    return TabBarView(physics: const NeverScrollableScrollPhysics(), controller: _tabController, children: [
      //physics'teki never ile sayfayı yana atarka gecısler engellenmıs oldu.
      IconLearnView(), const ImageLearn(), IconLearnView(), IconLearnView()
    ]);
  }
}

enum _MyTabViews { home, settings, favorite, profile }

extension _MyTabViewExtension on _MyTabViews {
  //hangı class'a yazacaksan "on" yazdıktan sonra onun adını yaz
  //Buraya yazılan metodlar _MyTabViews'dekilerin özellikleri olacak.
}
