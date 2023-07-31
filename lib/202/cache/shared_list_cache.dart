import 'package:flutter/material.dart';
import 'package:flutter_full_learn2/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn2/202/cache/shared_manager.dart';
import 'package:flutter_full_learn2/202/cache/user_cache/user_cache_manager.dart';

class SharedListCache extends StatefulWidget {
  const SharedListCache({super.key});

  @override
  State<SharedListCache> createState() => _SharedListCacheState();
}

class _SharedListCacheState extends State<SharedListCache> {
  late final UserCacheManager userCacheManager;
  List<User> _users = UserItems().users;

  @override
  void initState() {
    super.initState();
    userCacheManager = UserCacheManager(SharedManager());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.download_for_offline_outlined)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.delete_outline_outlined)),
        ],
      ),
      body: _UserListView(
        users: _users,
      ),
    );
  }
}

class _UserListView extends StatelessWidget {
  _UserListView({super.key, required this.users});
  final List<User> users;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: ListTile(
            title: Text(users[index].name),
            subtitle: Text(users[index].description),
            trailing: Text(
              users[index].url,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(decoration: TextDecoration.underline),
            ),
          ),
        );
      },
    );
  }
}