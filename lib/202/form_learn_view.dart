import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({super.key});

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form(
        key: _key,
        autovalidateMode: AutovalidateMode.always,
        // Daha yazıya basladıgında bos bırakırsan orada bos bırakılamaz dıye yazı gelmeye baslar.
        onChanged: () {
          print('a');
        },
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty
                /*(value) {
                return (value?.isNotEmpty ?? false) ? null : 'Bu alan boş geçilemez.';
                // "value" bos degılse 'true' ; bos ise false dondurecek.
                //Devamındaki "?" soru işaretinden sonra ise parantez içi "true" döner ise 'null' döndür
                //  "false" dönerse 'Bu alan boş geçilemez'i döndür demek oluyor.
              }*/

                ),
            TextFormField(
              validator: FormFieldValidator().isNotEmpty,
              /*(value) {
                return (value?.isNotEmpty ?? false) ? null : 'Bu alan boş geçilemez.';
                // "value" bos degılse 'true' ; bos ise false dondurecek.
                //Devamındaki "?" soru işaretinden sonra ise parantez içi "true" döner ise 'null' döndür
                //  "false" dönerse 'Bu alan boş geçilemez.' i döndür demek oluyor.
                
              }
              */
            ),
            DropdownButtonFormField<String>(
              validator: FormFieldValidator().isNotEmpty,
              value: 'v',
              //başlangıcta ahngoısı yazsın istiyorsan onun value'sini yazıyorsun.
              items: const [
                DropdownMenuItem(value: 'v', child: Text('a')),
                DropdownMenuItem(value: 'v2', child: Text('a2')),
                DropdownMenuItem(value: 'v3', child: Text('a3'))
              ],
              onChanged: (value) {},
            ),
            CheckboxListTile(
              value: true,
              onChanged: (value) {},
            ),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) {
                    print('okey');
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

class ValidatorMessage {
  static const String _notEmpty = 'Bos gecılemez!';
}
