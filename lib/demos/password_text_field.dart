import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({super.key, this.controller});
  final TextEditingController? controller;
  //Text'in değerini alabılmek ıcın controller kullanmamız gerekıyor.

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  final _obscureCharacter = "-";
  bool _isSecure = true;

  void _changeLoading() {
    setState(() {
      _isSecure = !_isSecure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: widget.controller,
        autofillHints: const [AutofillHints.password],
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecure,
        //yazdıgın şifrenin görünmez olmasını saglıyor.
        obscuringCharacter: _obscureCharacter,
        //Bu da yazdıgında nasıl bır şekile çevirsin istediğin gibi ayarlayabılırsın.
        decoration:
            InputDecoration(border: const UnderlineInputBorder(), hintText: "Password", suffix: _onVisibilityIcon()));
  }

  IconButton _onVisibilityIcon() {
    return IconButton(
      onPressed: _changeLoading,
      //buna basıldıgında _changeLoadıng'i cagır dıyorum.
      icon: AnimatedCrossFade(
          //Animasyonlu bir şekilde "icon'un değişmesini sağlar."
          firstChild: const Icon(Icons.visibility_outlined),
          secondChild: const Icon(Icons.visibility_off_outlined),
          crossFadeState: _isSecure ? CrossFadeState.showSecond : CrossFadeState.showFirst,
          duration: const Duration(seconds: 2)),
      //icon: Icon(_isSecure ? Icons.visibility_off_outlined : Icons.visibility));
    );
  }
}
