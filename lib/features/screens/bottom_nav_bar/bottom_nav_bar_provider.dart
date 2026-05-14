import 'package:ai_chat_bot_app/ai_chat_bot_app.dart';
import 'package:ai_chat_bot_app/features/screens/ai_audio_video/ai_audio_video_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_avtar/ai_avtar_screen.dart';
import 'package:ai_chat_bot_app/features/screens/ai_chating/ai_chating_provider.dart';
import 'package:ai_chat_bot_app/features/screens/profile/profile_screen.dart';
import 'package:base_module/base_module.dart';
import 'package:flutter/cupertino.dart';
import 'package:lucide_icons/lucide_icons.dart';

import '../ai_chating/ai_chatting_screen.dart';
import '../home/home_screen.dart';

class BottomNavBarProvider extends BaseProvider {
  int currentIndex = 0;

  void changeIndex(int index) {
    currentIndex = index;
    notifyListeners();
  }

  final List<Map<String, dynamic>> screens = [
    {'icon': LucideIcons.home, 'label': 'Home', 'onTap': const HomeScreen()},
    {
      'icon': LucideIcons.users,
      'label': 'Avatars',
      'onTap': const AiAvtarScreen(),
    },
    {
      'icon': LucideIcons.messageSquare,
      'label': 'Ai Chatting',
      'onTap': const AiChattingScreen(),
    },
    {
      'icon': LucideIcons.phoneCall,
      'label': 'Ai Calling',
      'onTap': const AiAudioVideoScreen(),
    },
    {
      'icon': LucideIcons.user,
      'label': 'Profile',
      'onTap': const ProfileScreen(),
    },
  ];
}
