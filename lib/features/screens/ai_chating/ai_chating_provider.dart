import 'package:base_module/base_module.dart';
import 'package:flutter/material.dart';

import 'package:google_generative_ai/google_generative_ai.dart';

class AiChattingProvider extends BaseProvider {
  final TextEditingController messageController = TextEditingController();

  final ScrollController scrollController = ScrollController();

  /// YOUR GEMINI API KEY
  final String apiKey = "AIza...";

  /// GEMINI MODEL
  late final GenerativeModel model;

  /// CHAT SESSION
  ChatSession? chat;

  /// MESSAGES
  List<Map<String, dynamic>> messages = [];

  AiChattingProvider() {
    model = GenerativeModel(model: 'gemini-1.5-flash-latest', apiKey: apiKey);

    chat = model.startChat();
  }

  /// SEND MESSAGE
  Future<void> sendMessage() async {
    final text = messageController.text.trim();

    if (text.isEmpty) return;

    /// ADD USER MESSAGE
    messages.add({"message": text, "isUser": true, "time": DateTime.now()});

    notifyListeners();

    messageController.clear();

    _scrollToBottom();

    try {
      /// SEND TO GEMINI
      final response = await chat!.sendMessage(Content.text(text));
      print('adskfkdsf');

      final aiText = response.text ?? "No response from AI";

      /// ADD AI MESSAGE
      messages.add({
        "message": aiText,
        "isUser": false,
        "time": DateTime.now(),
      });

      notifyListeners();

      _scrollToBottom();
    } catch (e) {
      print('dsaffldsanf=> $e');
      String errorMessage = "Something went wrong";

      if (e.toString().contains("quota")) {
        errorMessage =
            "API quota exceeded.\nCheck billing or create a new API key.";
      }

      messages.add({
        "message": errorMessage,
        "isUser": false,
        "time": DateTime.now(),
      });

      notifyListeners();

      _scrollToBottom();
    }
  }

  /// AUTO SCROLL
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  /// TIME FORMAT
  String formatTime(DateTime time) {
    final hour = time.hour > 12 ? time.hour - 12 : time.hour;

    final minute = time.minute.toString().padLeft(2, '0');

    final period = time.hour >= 12 ? "PM" : "AM";

    return "$hour:$minute $period";
  }

  @override
  void dispose() {
    messageController.dispose();
    scrollController.dispose();
    super.dispose();
  }
}
