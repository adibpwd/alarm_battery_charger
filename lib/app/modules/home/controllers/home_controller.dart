import 'dart:math';
import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:battery/battery.dart';
import 'package:get/get.dart';
import '../models/battery_model.dart';
import 'package:get_storage/get_storage.dart';

class HomeController extends GetxController {
  var batteryM = BatteryModel();
  Battery battery = Battery();
  var box = GetStorage();
  var onOff = false.obs;
  final assetsAudioPlayer = AssetsAudioPlayer();

  @override
  void onReady() {
    assetsAudioPlayer.open(
      Audio("assets/nada-dering.wav"),
      // loopMode: LoopMode.none,
    );
    print('onready dari home controller');
    battery.onBatteryStateChanged.listen((state) async {
      if (state == BatteryState.charging) {
        playAudio();
        // changeStatusBattery('Charging');
        batteryM.status.value = 'Charging';
        // batteryM.batteryLevel.value = await battery.batteryLevel;
      } else {
        stopAudio();
        // changeStatusBattery('Discharging');
        batteryM.status.value = 'discharging';
      }
      print('hello world oalsdfasdfsdf');
      batteryM.batteryLevel.value = await battery.batteryLevel;
    });
    super.onReady();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }

  void changeStatusBattery(data) {
    batteryM.status.value = data;
    print('dari change status battery');
    print('data');
  }

  void playAudio() {
    if (onOff.value) {
      assetsAudioPlayer.setLoopMode(LoopMode.single);
      assetsAudioPlayer.playOrPause();
    }
  }

  void stopAudio() {
    assetsAudioPlayer.setLoopMode(LoopMode.none);
    assetsAudioPlayer.stop();
  }

  String getRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }
}
