// lib/features/support/chat_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final messages = <ChatMessage>[].obs;
  final messageController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    // Add a welcome message
    messages.add(
      ChatMessage(
        text: 'مرحباً! كيف يمكنني مساعدتك اليوم؟',
        isMe: false,
        time: DateTime.now(),
      ),
    );
  }

  void sendMessage() {
    if (messageController.text.trim().isEmpty) return;

    messages.add(
      ChatMessage(
        text: messageController.text,
        isMe: true,
        time: DateTime.now(),
      ),
    );

    // Simulate reply after 1 second
    Future.delayed(const Duration(seconds: 1), () {
      messages.add(
        ChatMessage(
          text: 'شكراً لتواصلك معنا. سوف نقوم بالرد عليك قريباً.',
          isMe: false,
          time: DateTime.now(),
        ),
      );
    });

    messageController.clear();
  }

  @override
  void onClose() {
    messageController.dispose();
    super.onClose();
  }
}

class ChatMessage {
  final String text;
  final bool isMe;
  final DateTime time;

  ChatMessage({required this.text, required this.isMe, required this.time});
}
