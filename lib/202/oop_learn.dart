import 'dart:io';

import 'package:flutter_full_learn2/202/custom_exception.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

abstract class IFileDownload {
  //Soyut bir sınıf.
// abstract class => Bir iş yapacak katmanın iskeletini oluşturmaya yarar.
  bool? downloadItem(FileItem? fileItem);

  toShare(String path) async {
    !await launchUrl(path as Uri);
  }
}

class FileDownload extends IFileDownload with ShareMixin {
  // "extends" Üst sınıfın bütün özelliklerini alacak ama ana özelliklerini de tekrar edeceğim anlamındadır.
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('object');
    return true;
  }

  @override
  toShare(String path) {
    throw UnimplementedError();
  }

  @override
  void share(args) {
    // TODO: implement share
  }
}

class SMSDownload implements IFileDownload {
  @override
  bool? downloadItem(FileItem? fileItem) {
    if (fileItem == null) throw FileDownloadException();

    print('object');
    return true;
  }

  @override
  Future<void> toShare(String path) async {
    !await launchUrlString("sms:$path");
  }
}

class FileItem {
  final String name;
  final File file;

  FileItem(this.name, this.file);
}

mixin ShareMixin on IFileDownload {
  // "on" diyerek sadece bellı durumlardan turemesini saglayabılıyoruz.
  void share(args);
  //Bu şekilde içini doldurmadan da functşın yazıp bırakabılırız.
  void toShowFile() {}
}
