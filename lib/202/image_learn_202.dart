import 'package:flutter/material.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ImagePaths.Chicken_Noodle.toWidget(),
    );
  }
}

enum ImagePaths {
  // ignore: constant_identifier_names
  Chicken_Noodle
}

extension ImagePathsExtension on ImagePaths {
  // ignore: non_constant_identifier_names
  String path() {
    return 'assets/png/$name.png';
  }

  Widget toWidget() {
    return Image.asset(path());
  }
}
