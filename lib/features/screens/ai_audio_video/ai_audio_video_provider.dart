import 'dart:async';

import 'package:base_module/base_module.dart';

class AiAudioVideoProvider extends BaseProvider {
  int callDuration = 0;

  bool isMuted = false;
  bool isVideoOn = true;

  Timer? timer;

  AiAudioVideoProvider() {
    startTimer();
  }

  /// START TIMER

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
          (_) {
        callDuration++;
        notifyListeners();
      },
    );
  }

  /// FORMAT TIME

  String formatDuration() {
    final mins = (callDuration ~/ 60)
        .toString()
        .padLeft(2, '0');

    final secs = (callDuration % 60)
        .toString()
        .padLeft(2, '0');

    return "$mins:$secs";
  }

  /// TOGGLE MIC

  void toggleMute() {
    isMuted = !isMuted;
    notifyListeners();
  }

  /// TOGGLE VIDEO

  void toggleVideo() {
    isVideoOn = !isVideoOn;
    notifyListeners();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}