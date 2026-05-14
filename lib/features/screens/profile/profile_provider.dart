import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class ProfileProvider extends BaseProvider{
  bool notificationEnabled = false;

  bool darkModeEnabled = false;

  final List<Map<String, dynamic>> stats = [
    {
      "label": "Total Calls",
      "value": "47",
      "color": const Color(0xff00E5FF),
    },
    {
      "label": "Chat Messages",
      "value": "1.2K",
      "color": const Color(0xffFF4FD8),
    },
    {
      "label": "Favorites",
      "value": "5",
      "color": const Color(0xffFFC107),
    },
  ];

  void toggleNotification(bool value) {
    notificationEnabled = value;
    notifyListeners();
  }

  void toggleDarkMode(bool value) {
    darkModeEnabled = value;
    notifyListeners();
  }
}