import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class HomeProvider extends BaseProvider{
  final List<Map<String, dynamic>> trendingAvatars = [
    {
      "name": "Sophia",
      "emoji": "👩‍💼",
      "rating": "4.9",
      "personality": "Business Expert",
      "colors": [
        const Color(0xff00E5FF),
        const Color(0xff7B61FF),
      ],
    },
    {
      "name": "Nova",
      "emoji": "🎀",
      "rating": "4.8",
      "personality": "Cute & Friendly",
      "colors": [
        const Color(0xffFF4FD8),
        const Color(0xff7B61FF),
      ],
    },
    {
      "name": "Zara",
      "emoji": "💃",
      "rating": "4.7",
      "personality": "Fashion Queen",
      "colors": [
        const Color(0xffFF9966),
        const Color(0xffFF5E62),
      ],
    },
    {
      "name": "Leo",
      "emoji": "🎮",
      "rating": "4.9",
      "personality": "Gaming Master",
      "colors": [
        const Color(0xff56CCF2),
        const Color(0xff2F80ED),
      ],
    },
  ];
}
