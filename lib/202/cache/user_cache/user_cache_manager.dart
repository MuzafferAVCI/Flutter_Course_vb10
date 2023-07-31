import 'dart:convert';
import 'package:flutter_full_learn2/202/cache/shared_learn_cache.dart';
import 'package:flutter_full_learn2/202/cache/shared_manager.dart';

class UserCacheManager {
  final SharedManager sharedManager;

  UserCacheManager(this.sharedManager);

  void saveItems(List<User> items) {
    //Compute
    final _items = items.map((element) => jsonEncode(element)).toList();
    SharedManager().saveStringItems(SharedKeys.users, _items);
  }

  List<User>? getItems() {
    //  "List<User>" döndürecegım dıye ekledım yoksa null döndürecek.
    //Compute
    final itemsString = SharedManager().getStrings(SharedKeys.users);
    if (itemsString?.isNotEmpty ?? false) {
      return itemsString!.map((element) {
        final jsonObject = jsonDecode(element);
        return User('name', 'description', 'b');
      }).toList();
    }
    return null;
  }
}
