// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

import 'model_learn.dart';

class ModelLearnView extends StatefulWidget {
  const ModelLearnView({Key? key}) : super(key: key);

  @override
  State<ModelLearnView> createState() => _ModelLearnViewState();
}

class _ModelLearnViewState extends State<ModelLearnView> {
  var user9 = PostModel8(body: 'wadsass');
  //Basına "var" koyduk yanı bu değiştirilebilir bır property yapacagız.
  //"var" koymak yerıne 'Postmodel8' diye de yazabılırdık aynı anlama gelıyor.
  @override
  void initState() {
    super.initState();
    final user1 = PostModel1()
      ..userId = 1
      ..body = 'vd';
    //Baş tarafına '..' iki nokta koyarak da degerlerını atabılırız.
    user1.body = 'hello';

    final user2 = PostModel2(1, 2, 'sd', 'sdaa');
    user2.body = 'dasda';
    // değerler final olarak işaretlenmediği için sonradan kendınden deger atabılıyorsun.

    final user3 = PostModel3(2, 3, 'sd', 'ddsv ');
    //user3.body = 'dasda';
    //Bir kere tanımladıktan sonra update edemezsın cunku fınal olarak tanımlanmışlar.

    //Localde kullanacaksan texfield falan bunu kullanmak daha mantıklı (user4).
    final user4 = PostModel4(userId: 3, id: 2, title: 'dsad', body: 'adsdq');
    //user4.body = 'ads';
    //Bir kere tanımladıktan sonra update edemezsın cunku fınal olarak tanımlanmışlar.

    final user5 = PostModel5(userId: 2, id: 3, title: 'title', body: 'body');
    //user5.  dediğimiz zaman herhangi bir şekilde variablelara '.' noktaya basınca gözükmüyor.
    //sadece postmodel5 in yapısında encapsulate (get ile falan) edersen senın kurallarına göre erişim yapabılıyor.

    final user6 = PostModel6(userId: 2, id: 2, title: 'title', body: 'body');
    // Bu da user5 ile aynı muhabbet.

    final user7 = PostModel7();
    //Burada senın illa bır deger vermen gerekmıyor.
    //Deger vermedıgın zaman kendı default degerlerını alıyor.

    //Servisten data çekiyorsan en mantıklısı bu: (user8'deki kullanım şekli)
    final user8 = PostModel8(body: 'w');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        setState(() {
          user9 = user9.copyWith(title: 'vbs');
          user9.updateBody('data updated');
        });
      }),
      appBar: AppBar(
        title: Text(user9.body ?? 'Not has any data'),
        //"??" bu işaret eger bır verı yoksa bunu yaz demek.
      ),
    );
  }
}
