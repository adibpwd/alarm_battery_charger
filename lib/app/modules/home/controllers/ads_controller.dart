import 'package:get/get.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class AdsController extends GetxController {
  // final BannerAd myBanner = BannerAd(
  //   adUnitId: 'ca-app-pub-3940256099942544/6300978111',
  //   size: AdSize.banner,
  //   request: AdRequest(),
  //   listener: BannerAdListener(),
  // );

  // var adWidget;

  // @override
  // void onInit() {
  //   myBanner.load();

  //   adWidget = AdWidget(ad: myBanner);
  //   super.onInit();
  // }

  final controller = NativeAdController();

  @override
  void onReady() {
    controller.load(keywords: ['valorant', 'games', 'fortnite']);
    print(controller);
    print('controller');
    super.onReady();
  }
}
