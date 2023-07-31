import 'package:flutter/material.dart';

class ImageLearn extends StatelessWidget {
  const ImageLearn({Key? key}) : super(key: key);
  final String _imagePath =
      'https://upload.wikimedia.org/wikipedia/commons/thumb/0/00/Apple-book.svg/2036px-Apple-book.svg.png';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          SizedBox(
            child: PngImages(name: ImageItems().appleWithoutBook),
          ),
          Image.network(
            _imagePath,
            errorBuilder: (context, error, stackTrace) => PngImages(name: ImageItems().appleWithoutBook),
          )
        ],
      ),
    );
  }
}

class PngImages extends StatelessWidget {
  const PngImages({Key? key, required this.name}) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      _nameWithPath,
      fit: BoxFit.cover,
      height: 200,
      // color: Colors.red,
    );
  }

  String get _nameWithPath => 'assets/png/$name.png';
}

class ImageItems {
  final String appleWithBook = "6715502";
  final String appleWithBook2 = "assets/png/images.png";
  final String appleWithoutBook = "images";
}
