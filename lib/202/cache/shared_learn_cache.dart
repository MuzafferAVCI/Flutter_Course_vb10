import 'package:flutter/material.dart';
import 'package:flutter_full_learn2/202/cache/shared_manager.dart';

class SharedLearn extends StatefulWidget {
  const SharedLearn({super.key});

  @override
  State<SharedLearn> createState() => _SharedLearnState();
}

class _SharedLearnState extends LoadingStatefull<SharedLearn> {
  int _currentValue = 0;
  late final SharedManager _manager;

  late final List<User> userItems;

  @override
  void initState() {
    super.initState();
    _manager = SharedManager();
    userItems = UserItems().users;
    initialize();
  }

  Future<void> initialize() async {
    _changeLoading();
    await _manager.init();
    _changeLoading();

    getDefaultValues();
  }

  Future<void> getDefaultValues() async {
    _onChangeValue(_manager.getString(SharedKeys.counter) ?? '');
  }

  void _onChangeValue(String value) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _value = int.tryParse(value);
    if (_value != null) {
      setState(() {
        _currentValue = _value;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_currentValue.toString()),
        actions: [_loading(context)],
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_removeValueButton(), _saveValueButton()],
      ),
      body: Column(
        children: [
          TextField(
            onChanged: (value) {
              _onChangeValue(value);
            },
          ),
        ],
      ),
    );
  }

  SingleChildRenderObjectWidget _loading(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).scaffoldBackgroundColor,
            ),
          )
        : const SizedBox.shrink();
  }

  FloatingActionButton _saveValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.save),
      onPressed: () async {
        _changeLoading();
        await _manager.saveString(SharedKeys.counter, _currentValue.toString());
        _changeLoading();
      },
    );
  }

  FloatingActionButton _removeValueButton() {
    return FloatingActionButton(
      child: const Icon(Icons.delete_outline_outlined),
      onPressed: () async {
        _changeLoading();
        await _manager.removeItem(SharedKeys.counter);
        _changeLoading();
      },
    );
  }
}

class User {
  final String name;
  final String description;
  final String url;

  User(this.name, this.description, this.url);
}

class UserItems {
  late final List<User> users;

  UserItems() {
    users = [
      User('vb', '10', 'vb10.dev'),
      User('vb2', '102', 'vb10.dev'),
      User('vb3', '103', 'vb10.dev'),
    ];
  }
}

//Generic
abstract class LoadingStatefull<T extends StatefulWidget> extends State<T> {
  bool isLoading = false;
  void _changeLoading() {
    setState(() {
      isLoading = !isLoading;
    });
  }
}
