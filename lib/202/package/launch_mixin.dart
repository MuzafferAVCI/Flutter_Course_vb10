import 'package:url_launcher/url_launcher.dart';

//"mixin" kullanma sebebımız sadece bundan turetılmışlerde kullan veya sadece bu durumu karsılayanlarda kullan dıyebılıyor olmamız.
mixin LaunchMixin {
  Future<void> launchUrl(Uri url) async {
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    }
  }
}
