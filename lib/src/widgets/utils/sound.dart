import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';

class PlaySound {
  static Future<void> notification() async {
    try {
      final player = AudioPlayer();
      await player.setAsset('assets/sounds/notification.mp3');
      await player.play();
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
