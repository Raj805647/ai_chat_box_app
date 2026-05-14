import 'package:base_module/base_module.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter/material.dart';

class NotificationProvider extends BaseProvider {
  final List<Map<String, dynamic>> notifications = [
    {
      'id': '1',
      'icon': LucideIcons.phone,
      'title': 'Missed call from Sophia',
      'message': 'You missed a call 2 hours ago',
      'time': '2h ago',
      'color': const Color(0xff00E5FF),
    },

    {
      'id': '2',
      'icon': LucideIcons.messageCircle,
      'title': 'New message from Nova',
      'message': 'Hey! Want to chat?',
      'time': '5h ago',
      'color': const Color(0xffFF4FD8),
    },

    {
      'id': '3',
      'icon': LucideIcons.userPlus,
      'title': 'New avatar available',
      'message': 'Max is now available in your network',
      'time': '1d ago',
      'color': const Color(0xffFFC107),
    },

    {
      'id': '4',
      'icon': LucideIcons.star,
      'title': 'Rating reminder',
      'message': 'How was your call with Luna?',
      'time': '2d ago',
      'color': const Color(0xff7B61FF),
    },

    {
      'id': '5',
      'icon': LucideIcons.bell,
      'title': 'System update',
      'message': 'New features are now available',
      'time': '3d ago',
      'color': Colors.white60,
    },
  ];

  void clearAllNotifications() {
    notifications.clear();
    notifyListeners();
  }
}
