import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AiChattingProvider extends BaseProvider{
final TextEditingController messageController =
TextEditingController();

final ScrollController scrollController =
ScrollController();

List<Map<String, dynamic>> messages = [
  {
    "id": "1",
    "message":
    "Hello! I'm your AI assistant. How can I help you today?",
    "isUser": false,
    "time": TimeOfDay.now(),
  },
];

/// SEND MESSAGE

void sendMessage() {
  if (messageController.text.trim().isEmpty) {
    return;
  }

  messages.add({
    "id":
    DateTime.now()
        .millisecondsSinceEpoch
        .toString(),
    "message": messageController.text,
    "isUser": true,
    "time": TimeOfDay.now(),
  });

  final userMessage = messageController.text;

  messageController.clear();

  notifyListeners();

  scrollToBottom();

  /// DEMO AI RESPONSE

  Future.delayed(
    const Duration(seconds: 1),
        () {
      messages.add({
        "id":
        DateTime.now()
            .millisecondsSinceEpoch
            .toString(),
        "message":
        "This is a demo response. In the full version, I would process your message and provide a helpful response!",
        "isUser": false,
        "time": TimeOfDay.now(),
      });

      notifyListeners();

      scrollToBottom();
    },
  );
}

/// SCROLL

void scrollToBottom() {
  Future.delayed(
    const Duration(milliseconds: 100),
        () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration:
          const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    },
  );
}

String formatTime(TimeOfDay time) {
  final hour = time.hour > 12
      ? time.hour - 12
      : time.hour;

  final minute = time.minute
      .toString()
      .padLeft(2, '0');

  final period =
  time.hour >= 12 ? "PM" : "AM";

  return "$hour:$minute $period";
}

@override
void dispose() {
  messageController.dispose();
  scrollController.dispose();
  super.dispose();
}
}