// import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:battery/battery.dart';
import '../controllers/home_controller.dart';

// ignore: must_be_immutable
class HomeView extends GetView<HomeController> {
  var homeC = Get.put(HomeController());
  Battery battery = Battery();

  @override
  Widget build(BuildContext context) {
    battery.onBatteryStateChanged.listen((state) {
      if (state == BatteryState.charging) {
        homeC.playAudio();
        homeC.changeStatusBattery('lagi di cas');
      } else {
        homeC.stopAudio();
        homeC.changeStatusBattery('enggak di cas');
      }
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Obx(() => Column(
            children: [
              Center(
                child: Text(
                  'baterainya : ${homeC.battery.status}\n',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Switch(
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      print('ke klik loho guys');
                      // homeC.playAudio();
                      homeC.playAudio();
                    },
                    child: Text('play'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      print('ke klik loho guys');
                      // homeC.playAudio();
                      homeC.stopAudio();
                    },
                    child: Text('stop'),
                  ),
                ],
              )
            ],
          )),
    );
  }
}
