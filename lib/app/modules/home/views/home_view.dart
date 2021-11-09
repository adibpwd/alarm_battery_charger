// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:alarm/app/modules/home/controllers/ads_controller.dart';
import 'package:alarm/app/modules/home/models/battery_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:battery/battery.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';
// import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../controllers/home_controller.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'credits_view.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  var homeC = Get.put(HomeController());
  var adsC = Get.put(AdsController());
  Battery battery = Battery();
  final batteryM = BatteryModel();

  @override
  Widget build(BuildContext context) {
    var widthS = MediaQuery.of(context).size.width;
    var heightS =
        MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          // color: Colors.red,
          padding: EdgeInsets.only(
            top: (widthS >= 768) ? heightS / 12 : heightS / 20,
          ),
          child: Obx(
            () => Column(
              children: [
                if (widthS >= 768)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IndicatorBattery(homeC: homeC),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        children: [
                          TestAudio(homeC: homeC),
                          StopAudio(homeC: homeC),
                        ],
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      Center(
                        child: IndicatorBattery(homeC: homeC),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 32,
                        ),
                        child: Row(
                          // crossAxisAlignment: CrossAxisAlignment.stretch,
                          // mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(
                              child: TestAudio(homeC: homeC),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 14,
                              ),
                            ),
                            Expanded(
                              child: StopAudio(homeC: homeC),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                Padding(
                  padding: EdgeInsets.all(14),
                  child: Row(
                    children: [
                      Expanded(
                        flex: (widthS >= 764) ? 8 : 12,
                        child: Text(
                            (kDebugMode) ? 'debug bos' : 'bukan debug bos'),
                      ),
                      Expanded(
                        flex: 1,
                        child: Switch(
                          // materialTapTargetSize: MaterialTapTargetSize.padded,
                          value: homeC.onOff.value,
                          onChanged: (value) {
                            print(value);
                            print(homeC.onOff);
                            homeC.onOff.value = value;

                            print('dari switch onchanege');
                            // print(homeC.onOff);
                          },
                          activeTrackColor: Colors.lightGreenAccent,
                          activeColor: Colors.green,
                        ),
                      ),
                    ],
                  ),
                ),
                if (adsC.controller.isLoaded) ads1(adsC: adsC),
                SizedBox(
                  height: 10,
                ),
                ads2(),
                SizedBox(
                  height: 10,
                ),
                ads3(),
                SizedBox(height: 10),
                ads4(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 3,
            child: Text(''),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              onPressed: () {
                Get.to(CreditsView());
              },
              child: Text(
                'credits',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class StopAudio extends StatelessWidget {
  const StopAudio({
    Key? key,
    required this.homeC,
  }) : super(key: key);

  final HomeController homeC;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.symmetric(
          //   horizontal: 45,
          //   vertical: 14,
          // ),
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      onPressed: () {
        print('ke klik loho guys');
        // homeC.playAudio();
        homeC.stopAudio();
      },
      child: Container(
        width: 90,
        child: Center(
          child: Text('Stop'),
        ),
      ),
      // child: Container(
      //   width: 190,
      //   height: 50,
      //   color: Colors.blue,
      //   child: Center(
      //     child: Text('Stop'),
      //   ),
      // ),
    );
  }
}

class TestAudio extends StatelessWidget {
  const TestAudio({
    Key? key,
    required this.homeC,
  }) : super(key: key);

  final HomeController homeC;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // padding: EdgeInsets.symmetric(
          //   horizontal: 45,
          //   vertical: 14,
          // ),
          shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      )),
      onPressed: () {
        print('ke klik loho guys');
        // homeC.playAudio();
        homeC.playAudio();
      },
      child: Container(
        width: 90,
        child: Center(
          child: Text('Test Audio'),
        ),
      ),
      // child: Container(
      //   width: 190,
      //   height: 50,
      //   color: Colors.blue,
      //   child: Center(
      //     child: Text('Start Audio'),
      //   ),
      // ),
    );
  }
}

class IndicatorBattery extends StatelessWidget {
  const IndicatorBattery({
    Key? key,
    required this.homeC,
  }) : super(key: key);

  final HomeController homeC;

  @override
  Widget build(BuildContext context) {
    return new CircularPercentIndicator(
      radius: 150.0,
      lineWidth: 16.0,
      animation: true,
      percent: homeC.batteryM.batteryLevel / 100,
      center: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${homeC.batteryM.batteryLevel}%",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ),
          ),
          Text(
            "${homeC.batteryM.status}",
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8.0,
            ),
          )
        ],
      ),
      // footer: new ,
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: (homeC.batteryM.batteryLevel <= 15)
          ? Colors.red
          : (homeC.batteryM.batteryLevel <= 50)
              ? Colors.blue
              : Colors.green,
    );
  }
}

class ads4 extends StatelessWidget {
  const ads4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NativeAd(
      height: 300,
      // unitId: MobileAds.nativeAdVideoTestUnitId,
      builder: (context, child) {
        return Material(
          elevation: 8,
          child: child,
        );
      },
      buildLayout: fullBuilder,
      loading: Text('loading'),
      error: Text('error'),
      icon: AdImageView(size: 40),
      headline: AdTextView(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxLines: 1,
      ),
      media: AdMediaView(
        height: 180,
        width: MATCH_PARENT,
        elevation: 6,
        elevationColor: Colors.deepPurpleAccent,
      ),
      attribution: AdTextView(
        width: WRAP_CONTENT,
        height: WRAP_CONTENT,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: EdgeInsets.only(right: 4),
        maxLines: 1,
        // text: 'Anúncio',
        decoration: AdDecoration(
          borderRadius: AdBorderRadius.all(10),
          border: BorderSide(color: Colors.green, width: 1),
        ),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      button: AdButtonView(
        elevation: 18,
        elevationColor: Colors.blue[400],
        height: MATCH_PARENT,
      ),
      ratingBar: AdRatingBarView(starsColor: Colors.white),
    );
  }
}

class ads3 extends StatelessWidget {
  const ads3({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NativeAd(
      height: 300,
      // unitId: MobileAds.nativeAdVideoTestUnitId,
      builder: (context, child) {
        return Material(
          elevation: 8,
          child: child,
        );
      },
      buildLayout: fullBuilder,
      loading: Text('loading'),
      error: Text('error'),
      icon: AdImageView(size: 40),
      headline: AdTextView(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        maxLines: 1,
      ),
      media: AdMediaView(
        height: 180,
        width: MATCH_PARENT,
        elevation: 6,
        elevationColor: Colors.deepPurpleAccent,
      ),
      attribution: AdTextView(
        width: WRAP_CONTENT,
        height: WRAP_CONTENT,
        padding: EdgeInsets.symmetric(horizontal: 2, vertical: 0),
        margin: EdgeInsets.only(right: 4),
        maxLines: 1,
        // text: 'Anúncio',
        decoration: AdDecoration(
          borderRadius: AdBorderRadius.all(10),
          border: BorderSide(color: Colors.green, width: 1),
        ),
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
      button: AdButtonView(
        elevation: 18,
        elevationColor: Colors.blue[400],
        height: MATCH_PARENT,
      ),
      ratingBar: AdRatingBarView(starsColor: Colors.white),
    );
  }
}

class ads2 extends StatelessWidget {
  const ads2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return NativeAd(
      height: 115,
      builder: (context, child) {
        return Material(
          elevation: 8,
          child: child,
        );
      },
      buildLayout: smallAdTemplateLayoutBuilder,
      // buildLayout: secondBuilder,
      loading: Text('loading'),
      error: Text('error'),
      icon: AdImageView(size: 70),
      headline: AdTextView(
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        maxLines: 1,
      ),
      body: AdTextView(style: TextStyle(color: Colors.black)),
      advertiser: AdTextView(style: TextStyle(color: Colors.black)),
      media: AdMediaView(height: 80, width: 120),
      button: AdButtonView(
        decoration: AdDecoration(backgroundColor: Colors.blue),
        textStyle: TextStyle(color: Colors.black),
      ),
      attribution: AdTextView(
        width: WRAP_CONTENT,
        text: 'Ad',
        decoration: AdDecoration(
          border: BorderSide(color: Colors.green, width: 2),
          borderRadius: AdBorderRadius.all(16.0),
        ),
        style: TextStyle(color: Colors.green),
        padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 1.0),
      ),
    );
  }
}

class ads1 extends StatelessWidget {
  const ads1({
    Key? key,
    required this.adsC,
  }) : super(key: key);

  final AdsController adsC;

  @override
  Widget build(BuildContext context) {
    return NativeAd(
      controller: adsC.controller,
      height: 60,
      builder: (context, child) {
        return Material(
          elevation: 8,
          child: child,
        );
      },
      buildLayout: adBannerLayoutBuilder,
      loading: Text('loading'),
      error: Text('error'),
      icon: AdImageView(padding: EdgeInsets.only(left: 6)),
      headline: AdTextView(style: TextStyle(color: Colors.black)),
      advertiser: AdTextView(style: TextStyle(color: Colors.black)),
      body: AdTextView(style: TextStyle(color: Colors.black), maxLines: 1),
      media: AdMediaView(height: 70, width: 120),
      button: AdButtonView(
        margin: EdgeInsets.only(left: 6, right: 6),
        textStyle: TextStyle(color: Colors.white, fontSize: 14),
        elevation: 18,
        elevationColor: Colors.blue,
      ),
    );
  }
}

AdLayoutBuilder get fullBuilder => (ratingBar, media, icon, headline,
        advertiser, body, price, store, attribuition, button) {
      return AdLinearLayout(
        padding: EdgeInsets.all(10),
        // The first linear layout width needs to be extended to the
        // parents height, otherwise the children won't fit good
        width: MATCH_PARENT,
        decoration: AdDecoration(
            gradient: AdLinearGradient(
          colors: [Colors.indigo[300]!, Colors.indigo[700]!],
          orientation: AdGradientOrientation.tl_br,
        )),
        children: [
          media,
          AdLinearLayout(
            children: [
              icon,
              AdLinearLayout(children: [
                headline,
                AdLinearLayout(
                  children: [attribuition, advertiser, ratingBar],
                  orientation: HORIZONTAL,
                  width: MATCH_PARENT,
                ),
              ], margin: EdgeInsets.only(left: 4)),
            ],
            gravity: LayoutGravity.center_horizontal,
            width: WRAP_CONTENT,
            orientation: HORIZONTAL,
            margin: EdgeInsets.only(top: 6),
          ),
          AdLinearLayout(
            children: [button],
            orientation: HORIZONTAL,
          ),
        ],
      );
    };
