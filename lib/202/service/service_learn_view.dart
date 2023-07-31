// ignore_for_file: unused_field

import 'dart:io';

// ignore: depend_on_referenced_packages

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'comments_learn_view.dart';
import 'post_model.dart';
import 'post_service.dart';

class ServiceLearn extends StatefulWidget {
  const ServiceLearn({Key? key}) : super(key: key);

  @override
  State<ServiceLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServiceLearn> {
  List<PostModel>? _items;
  String? name;
  bool _isLoading = false;
  late final Dio _dio;

  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  //TEST EDİLEBİLİR KOD BAŞLADI.
  late final IPostService _postService;

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    _postService = PostService();
    //Burada eşitleyince aşağıda rahatça kullanabılırız (Clean Coding için yaptık.)
    name = "velli";
    fetchPostItemsAdvance();
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
      //Buna her girdiginde bunun tersini ver demek.
    });
  }

  Future<void> fetchPostItems() async {
    _changeLoading();
    final response = await Dio().get('https://jsonplaceholder.typicode.com/posts');
    //Bunun anlamı bu kodu bekle ve buradan sonra sıradakine geçme demek.

    if (response.statusCode == HttpStatus.ok) {
      //Bu işlem başarılı mı demek.
      //Başarılı ise buraya girecek.
      final _datas = response.data;

      if (_datas is List) {
        setState(() {
          _items = _datas.map((e) => PostModel.fromJson(e)).toList();
        });
        //Gelen dataları fromJson ile faklı bır liste olan _items'a liste olarak aktardık.
      }
    }
    //Yukarıdaki işlem bitince _isLoading'in durumunu değiştirecek asagıdakı metod.
    _changeLoading();
  }

  Future<void> fetchPostItemsAdvance() async {
    _changeLoading();
    _items = await _postService.fetchPostItemsAdvance();
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
        //_isLoading true ise circular : değilse sized yap demek.
      ),
      body: _items == null
          ? const Placeholder()
          : ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: _items?.length ?? 0,
              //length'i null ise items degerim sıfır olsun demek.
              itemBuilder: (context, index) {
                //Servisten gelen ve sıralı data göstereceksek ListView.builder() 'ı kullanmak daha affective.
                return _PostCard(model: _items?[index]);
              },
            ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({Key? key, required PostModel? model})
      : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CommentsLearnView(
              postId: _model?.id,
            ),
          ));
        },
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
