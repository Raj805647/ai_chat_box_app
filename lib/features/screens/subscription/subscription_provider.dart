import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class SubscriptionProvider extends BaseProvider{
  final List<Map<String, dynamic>> plans = [
    {
      "name": "Free",
      "price": "\$0",
      "period": "forever",
      "icon": LucideIcons.sparkles,
      "color": Colors.white54,
      "gradient": const [
        Color(0xff6B7280),
        Color(0xff4B5563),
      ],
      "features": [
        "2 AI avatars",
        "10 calls per month",
        "Basic chat features",
        "Community support",
      ],
      "popular": false,
    },

    {
      "name": "Pro",
      "price": "\$9.99",
      "period": "per month",
      "icon": LucideIcons.crown,
      "color": const Color(0xff00E5FF),
      "gradient": const [
        Color(0xff00E5FF),
        Color(0xff7B61FF),
      ],
      "features": [
        "All 8 AI avatars",
        "Unlimited calls",
        "Advanced chat features",
        "Priority support",
        "Voice customization",
        "Call recording",
      ],
      "popular": true,
    },

    {
      "name": "Ultra",
      "price": "\$19.99",
      "period": "per month",
      "icon": LucideIcons.zap,
      "color": const Color(0xffFFC107),
      "gradient": const [
        Color(0xffFFC107),
        Color(0xffFF4FD8),
      ],
      "features": [
        "Everything in Pro",
        "Custom AI avatars",
        "API access",
        "White-label option",
        "Dedicated support",
        "Early access to features",
      ],
      "popular": false,
    },
  ];
}