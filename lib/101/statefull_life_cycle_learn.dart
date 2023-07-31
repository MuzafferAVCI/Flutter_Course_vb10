import 'package:flutter/material.dart';

class StatefullLifeCycleLearn extends StatefulWidget {
  const StatefullLifeCycleLearn({Key? key, required this.message}) : super(key: key);
  final String message;
  @override
  State<StatefullLifeCycleLearn> createState() => _StatefullLifeCycleLearnState();
}

class _StatefullLifeCycleLearnState extends State<StatefullLifeCycleLearn> {
  String _message = '';
  late final bool _isOdd;
  //Constructor anında deger alacaksa basına "late" eklıyorsun.
  //initState daha ekran cızılmeden bu işini alacak ve degerını sabıtlemıs olacak. anlamına gelıyor.
  //ve deger atandıktan sonra baska bır deger atayamazsın

  @override
  void didChangeDependencies() {
    //bır seyden dolayı sayfa tekrardan draw edılmek zorunda kalırsa buradan tekrar tekrar
    //cagrılma durumu olursa buradan yapar.
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(covariant StatefullLifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      _message = widget.message;
      _computeName();
      setState(() {});
    }
  }

  @override
  void dispose() {
    //Sayfa öldüğünde buradaki çağırılır./ çalışır.
    super.dispose();
    _message = "";
  }

  @override
  void initState() {
    super.initState();
    _message = widget.message;
    _isOdd = widget.message.length.isOdd;
    _computeName();
  }

  void _computeName() {
    if (_isOdd) {
      _message += " Tek";
    } else {
      _message += " Çift";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_message)),
      // '?' soru işaretiyle yaptıgımız "short if" işlemiydi,
      // ilk yer eger if=true ise çalışır; ":" den sonraki yerde
      // if = false ise çalışır.
      body: _isOdd
          ? TextButton(onPressed: () {}, child: Text(_message))
          : ElevatedButton(onPressed: () {}, child: Text(_message)),
    );
  }
}
