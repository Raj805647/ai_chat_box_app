import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

class AiCallHistoryProvider extends BaseProvider{
  final List<Map<String, dynamic>> history = [
    {
      "id": "1",
      "type": "call",
      "avatar": "Sophia",
      "emoji": "👩‍💼",
      "duration": "12:34",
      "time": "Today, 2:30 PM",
      "color": const Color(0xff3B82F6),
    },
    {
      "id": "2",
      "type": "chat",
      "avatar": "Nova",
      "emoji": "🎀",
      "duration": "45 messages",
      "time": "Today, 11:15 AM",
      "color": const Color(0xffEC4899),
    },
    {
      "id": "3",
      "type": "call",
      "avatar": "Luna",
      "emoji": "🧘‍♀️",
      "duration": "8:22",
      "time": "Yesterday, 6:45 PM",
      "color": const Color(0xff8B5CF6),
    },
    {
      "id": "4",
      "type": "chat",
      "avatar": "Leo",
      "emoji": "🎮",
      "duration": "23 messages",
      "time": "Yesterday, 3:20 PM",
      "color": const Color(0xff10B981),
    },
    {
      "id": "5",
      "type": "call",
      "avatar": "Zara",
      "emoji": "💃",
      "duration": "15:47",
      "time": "2 days ago",
      "color": const Color(0xffFF006E),
    },
    {
      "id": "6",
      "type": "chat",
      "avatar": "Max",
      "emoji": "💪",
      "duration": "31 messages",
      "time": "3 days ago",
      "color": const Color(0xffFFBE0B),
    },
  ];
}