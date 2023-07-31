import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../product/language/language_items.dart';

class TextFieldLearn extends StatefulWidget {
  const TextFieldLearn({Key? key}) : super(key: key);

  @override
  State<TextFieldLearn> createState() => _TextFieldLearnState();
}

class _TextFieldLearnState extends State<TextFieldLearn> {
  final key = GlobalKey();

  final focusNodeTextfieldOne = FocusNode();
  final focusNodeTextfieldTwo = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            TextField(
                maxLength: 20,
                //max yazabılecegı karakter.
                buildCounter: (context, {int? currentLength, bool? isFocused, maxLength}) {
                  return _animatedContainer(currentLength);
                },
                keyboardType: TextInputType.emailAddress,
                autofillHints: const [AutofillHints.email],
                focusNode: focusNodeTextfieldOne,
                inputFormatters: [
                  TextprojectInputFormatter()._formatter,
                ],
                textInputAction: TextInputAction.next,
                //klavyede next yazısı cıkıyor ve basarsan bir sonrakı textfield a gecıyor.
                decoration: _InputDecorator().emailInput
                //TextField kullanıcının yazı yazmasını saglar.
                ),
            TextField(
              focusNode: focusNodeTextfieldTwo,
            )
          ],
        ));
  }

  AnimatedContainer _animatedContainer(int? currentLength) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      key: UniqueKey(),
      height: 10,
      width: 10.0 * (currentLength ?? 0),
      // "??" eger null ise default sıfır al demek.
      color: Colors.green,
      // "~" bu ısaretlı yer, küsüratı sıfır yapıp sonucu tam sayı yapıyor.
    );
  }
}

class TextprojectInputFormatter {
  final _formatter = TextInputFormatter.withFunction((oldValue, newValue) {
    if (newValue.text == "a") {
      return oldValue;
    }
    return oldValue;
  });
}

class _InputDecorator {
  final emailInput = const InputDecoration(
    prefixIcon: Icon(Icons.mail),
    border: OutlineInputBorder(),
    labelText: LanguageItems.mailTitle,
  );
}
