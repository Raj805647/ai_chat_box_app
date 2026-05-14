import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

import '../../../routes/route_names.dart';

class OnboardingProvider extends BaseProvider {
  final PageController pageController = PageController();

  int currentIndex = 0;

  final List<Map<String, dynamic>> onboardingData = [
    {
      "title": "Connect With AI Avatars",
      "description":
      "Talk, chat, and interact with next-generation AI companions.",
      "emoji": "🤖",
    },
    {
      "title": "Voice & Video Calling",
      "description":
      "Experience ultra realistic AI audio and video conversations.",
      "emoji": "📞",
    },
    {
      "title": "Smart AI Chat",
      "description":
      "Get instant responses, emotional intelligence, and premium support.",
      "emoji": "💬",
    },
  ];

  void onPageChanged(int index) {
    currentIndex = index;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (currentIndex == onboardingData.length - 1) {
      navigateTo(context, RouteNames.signInScreen);
    } else {
      pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
