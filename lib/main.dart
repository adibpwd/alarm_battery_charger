import 'package:alarm/app/modules/home/ads_id.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
import 'app/routes/app_pages.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await MobileAds.initialize(
    nativeAdUnitId: nativeAdUnitId,
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

String get nativeAdUnitId {
  /// Always test with test ads
  if (kDebugMode)
    return MobileAds.nativeAdTestUnitId;
  else
    // return 'ca-app-pub-3940256099942544/2247696110';
    return AdsId.idNative;
}
