// ignore_for_file: no_leading_underscores_for_local_identifiers, unused_local_variable, unused_field

class PostModel1 {
  //Basına "?" koyunca bu variablelar null gelebılır demek.
  int? userId;
  int? id;
  String? title;
  String? body;
}

class PostModel2 {
  //Bu variablelar uygulama oluştugunda gelecek demek.
  int userId;
  int id;
  String title;
  String body;

  PostModel2(this.userId, this.id, this.title, this.body);
}

class PostModel3 {
  //Başına final koyunca bu variablelar sadece constructor zamanında gelebılırler
  //ve initiliaze olabilir demek.
  //Diğer zamanlarda bu datalar gelemez.
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel3(this.userId, this.id, this.title, this.body);
}

class PostModel4 {
  final int userId;
  final int id;
  final String title;
  final String body;

  PostModel4({required this.userId, required this.id, required this.title, required this.body});
}

class PostModel5 {
  //En tavsiye ettiği modellerden bir tanesi
  //variableları alıyoruz ve müşteriye tekrar vermiyoruz.
  final int _userId;
  final int _id;
  final String _title;
  final String _body;

  PostModel5({
    required int userId,
    required int id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;
  /* {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }*/
}

class PostModel6 {
  //En tavsiye ettiği modellerden bir tanesi
  //variableları alıyoruz ve müşteriye tekrar vermiyoruz.
  //yazdıgımız "late" bu deger sonradan gelecek demek.
  //Sadece constructor anında sonradan gelebılır demek.
  //Diğer zamanlarda eşitleme yapmaya calısırsan crash alırsın uygulamanda.
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel6({
    required int userId,
    required int id,
    required String title,
    required String body,
  }) {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }
}

class PostModel7 {
  //En tavsiye ettiği modellerden bir tanesi
  //variableları alıyoruz ve müşteriye tekrar vermiyoruz.
  //yazdıgımız "late" bu deger sonradan gelecek demek.
  //Sadece constructor anında sonradan gelebılır demek.
  //Diğer zamanlarda eşitleme yapmaya calısırsan crash alırsın uygulamanda.
  late final int _userId;
  late final int _id;
  late final String _title;
  late final String _body;

  PostModel7({
    //Direkt olarak default deger atayabılıyorsun.
    //Bunu yaparak required vermeye gerek kalmıyor.
    int userId = 0,
    int id = 0,
    String title = '',
    String body = '',
  }) {
    int _userId = userId;
    int _id = id;
    String _title = title;
    String _body = body;
  }
}

class PostModel8 {
  //En tavsiye ettiği modellerden bir tanesi
  //variableları alıyoruz ve müşteriye tekrar vermiyoruz.
  //eger ınternetten datalar gelecek veya servisten.
  //Egerki ekranda texFiled a bunları yazdırmayacaksan en cok tavsıye ettıgı kullanım şekli bu.
  final int? userId;
  final int? id;
  final String? title;
  String? body;
  PostModel8({this.userId, this.id, this.title, this.body});

  void updateBody(String data) {
    // ignore: unnecessary_null_comparison
    if (data != null && data.isNotEmpty) {
      body = data;
    }
  }

//Bu copyWith ile yaptıgımız şey verdiğin variablelarda sadece değişik olanları değiştiriyor.
  PostModel8 copyWith({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) {
    return PostModel8(
      userId: userId ?? this.userId,
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
    );
  }
}
