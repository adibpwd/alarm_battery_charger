import 'package:alarm/app/modules/home/controllers/ads_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:native_admob_flutter/native_admob_flutter.dart';

class CreditsView extends GetView {
  var adsC = Get.put(AdsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Credit',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          shadowColor: Colors.white,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Image.network(
                    "https://img-authors.flaticon.com/freepik.jpg",
                    width: 80,
                    height: 80,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            if (adsC.controller.isLoaded)
              NativeAd(
                height: 320,
                unitId: MobileAds.nativeAdVideoTestUnitId,
                builder: (context, child) {
                  return Material(
                    elevation: 8,
                    child: child,
                  );
                },
                buildLayout: mediumAdTemplateLayoutBuilder,
                // buildLayout: fullBuilder,
                loading: Text('loading'),
                error: Text('error'),
                icon: AdImageView(size: 40),
                headline: AdTextView(
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                  maxLines: 1,
                ),
                body: AdTextView(
                    style: TextStyle(color: Colors.black), maxLines: 1),
                media: AdMediaView(
                  height: 170,
                  width: MATCH_PARENT,
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
                button: AdButtonView(
                  elevation: 18,
                  decoration: AdDecoration(backgroundColor: Colors.blue),
                  height: MATCH_PARENT,
                  textStyle: TextStyle(color: Colors.white),
                ),
                ratingBar: AdRatingBarView(starsColor: Colors.white),
              ),
            SizedBox(
              height: 10,
            ),
            NativeAd(
              height: 320,
              unitId: MobileAds.nativeAdVideoTestUnitId,
              builder: (context, child) {
                return Material(
                  elevation: 8,
                  child: child,
                );
              },
              buildLayout: mediumAdTemplateLayoutBuilder,
              // buildLayout: fullBuilder,
              loading: Text('loading'),
              error: Text('error'),
              icon: AdImageView(size: 40),
              headline: AdTextView(
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                maxLines: 1,
              ),
              body: AdTextView(
                  style: TextStyle(color: Colors.black), maxLines: 1),
              media: AdMediaView(
                height: 170,
                width: MATCH_PARENT,
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
              button: AdButtonView(
                elevation: 18,
                decoration: AdDecoration(backgroundColor: Colors.blue),
                height: MATCH_PARENT,
                textStyle: TextStyle(color: Colors.white),
              ),
              ratingBar: AdRatingBarView(starsColor: Colors.white),
            ),
            SizedBox(
              height: 10,
            ),
            NativeAd(
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
              body: AdTextView(
                  style: TextStyle(color: Colors.black), maxLines: 1),
              media: AdMediaView(height: 70, width: 120),
              button: AdButtonView(
                margin: EdgeInsets.only(left: 6, right: 6),
                textStyle: TextStyle(color: Colors.white, fontSize: 14),
                elevation: 18,
                elevationColor: Colors.blue,
              ),
            ),
            Spacer(),
            Expanded(
              child: Column(
                children: [
                  Text(
                    "thank you for using our application",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Spacer(),
                  Text(
                      "email : adibtambak@gmail.com\nTelegram/WhatsApp : +681575823200"),
                  Spacer(),
                ],
              ),
            ),
          ],
        ));
  }
}
