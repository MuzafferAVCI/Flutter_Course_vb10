import 'package:flutter/material.dart';

class NavigateDetailLearnDart extends StatefulWidget {
  const NavigateDetailLearnDart({super.key, this.isOkey = false});
  final bool isOkey;
  @override
  State<NavigateDetailLearnDart> createState() => _NavigateDetailLearnDartState();
}

class _NavigateDetailLearnDartState extends State<NavigateDetailLearnDart> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //ModalRoute.of(context)?.settings.arguments;
    //Bu başka bir yol ama önermiyor.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
          child: ElevatedButton.icon(
              //Iconlu button yapmayı saglar.
              onPressed: () {
                Navigator.of(context).pop(!widget.isOkey);
                //bununla gerıye boolean donduruyorum.
                //"Onayla" tusuna basıldıgında basıldıgına daır boolean gönder diyoruz burada.
              },
              icon: Icon(
                Icons.check,
                color: widget.isOkey ? Colors.red : Colors.green,
                //"isOkey" boolean'ını kullanarak Red button işlevi de kattık.
              ),
              label: widget.isOkey ? const Text('Red') : const Text('Onayla'))),
    );
  }
}
