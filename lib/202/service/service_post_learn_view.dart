import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'post_model.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({Key? key}) : super(key: key);

  @override
  State<ServicePostLearn> createState() => _ServiceLearnState();
}

class _ServiceLearnState extends State<ServicePostLearn> {
  String? name;
  bool _isLoading = false;
  late final Dio _dio;
  final _baseUrl = 'https://jsonplaceholder.typicode.com/';

  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: _baseUrl));
    //Burada eşitleyince aşağıda rahatça kullanabılırız (Clean Coding için yaptık.)
  }

  void _changeLoading() {
    setState(() {
      _isLoading = !_isLoading;
      //Buna her girdiginde bunun tersini ver demek.
    });
  }

  Future<void> _addItemToService(PostModel postModel) async {
    _changeLoading();
    final response = await _dio.post('posts', data: postModel, options: Options(contentType: Headers.jsonContentType));
    //options: Options(contentType: Headers.jsonContentType) "bunu ekleme sebebım => hata verıyordu." Ekledıkten sonra sorun yok.

    if (response.statusCode == HttpStatus.created) {
      name = 'Basarili';
    }
    _changeLoading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [_isLoading ? const CircularProgressIndicator.adaptive() : const SizedBox.shrink()],
        //_isLoading true ise circular : değilse sized yap demek.
      ),
      body: Column(
        children: [
          TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: 'Title'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
            //adam klavyeden yazarken sag alt tarafta next tusu oluyor
            //"next" tusuna basıp bir sonrakı textField alanına gecıs yapabılıyor.
          ),
          TextField(
            controller: _bodyController,
            decoration: const InputDecoration(labelText: 'Body'),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          TextField(
            controller: _userIdController,
            autofillHints: const [AutofillHints.creditCardNumber],
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: 'UserId'),
          ),
          TextButton(
              onPressed: _isLoading
                  ? null
                  : () {
                      if (_titleController.text.isNotEmpty &&
                          _bodyController.text.isNotEmpty &&
                          _userIdController.text.isNotEmpty) {
                        final model = PostModel(
                            body: _bodyController.text,
                            title: _titleController.text,
                            userId: int.tryParse(_userIdController.text));
                        //userId'nin type'ı integer oldugu için böyle bir dönüşüm kullandık.
                        _addItemToService(model);
                      }
                    },
              child: const Text('Send'))
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  const _PostCard({
    Key? key,
    required PostModel? model,
  })  : _model = model,
        super(key: key);

  final PostModel? _model;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        title: Text(_model?.title ?? ''),
        subtitle: Text(_model?.body ?? ''),
      ),
    );
  }
}
