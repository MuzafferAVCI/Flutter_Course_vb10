import 'package:flutter/material.dart';
import 'package:flutter_full_learn2/202/package/launch_mixin.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package/loading_bar.dart';

class PackageLearnView extends StatefulWidget {
  const PackageLearnView({Key? key}) : super(key: key);

  @override
  State<PackageLearnView> createState() => _PackageLearnViewState();
}

class _PackageLearnViewState extends State<PackageLearnView> with TickerProviderStateMixin, LaunchMixin {
  final Uri url = Uri.parse('https://pub.dev/packages/url_launcher');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        floatingActionButton: FloatingActionButton(
          backgroundColor: ButtonTheme.of(context).colorScheme?.secondary,
          onPressed: () {
            launchUrl(url);
          },
        ),
        body: Column(
          children: [
            Text(
              "data",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const LoadingBar(),
          ],
        ));
  }
}
