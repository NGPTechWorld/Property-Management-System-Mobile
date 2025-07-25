import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:property_ms/core/utils/color_manager.dart';
import 'package:property_ms/core/utils/values_manager.dart';
import 'package:property_ms/core/utils/widgets/normal_app_bar.dart';

import 'chat_controller.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NormalAppBar(title: 'الدردشة الحية'),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              final messages = controller.messages.reversed.toList();
              return ListView.builder(
                reverse: true,
                padding: const EdgeInsets.all(AppPadding.p16),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return MessageBubble(message: messages[index]);
                },
              );
            }),
          ),
          MessageInput(controller: controller),
        ],
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: message.isMe ? Alignment.centerLeft : Alignment.centerRight,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: AppPadding.p8),
        padding: const EdgeInsets.symmetric(
          horizontal: AppPadding.p16,
          vertical: AppPadding.p12,
        ),
        decoration: BoxDecoration(
          color:
              message.isMe
                  ? ColorManager.primaryColor.withOpacity(0.1)
                  : ColorManager.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: const Radius.circular(AppSize.s16),
            topRight: const Radius.circular(AppSize.s16),
            bottomLeft:
                message.isMe
                    ? const Radius.circular(AppSize.s16)
                    : const Radius.circular(0),
            bottomRight:
                message.isMe
                    ? const Radius.circular(0)
                    : const Radius.circular(AppSize.s16),
          ),
        ),
        child: Text(
          message.text,
          style: Get.textTheme.bodyMedium!.copyWith(
            color: message.isMe ? ColorManager.primaryDark : Colors.white,
          ),
        ),
      ),
    );
  }
}

class MessageInput extends StatelessWidget {
  final ChatController controller;

  const MessageInput({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppPadding.p16,
        vertical: AppPadding.p8,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: controller.messageController,
              decoration: InputDecoration(
                hintText: 'اكتب رسالتك هنا...',
                hintStyle: Get.textTheme.bodyMedium!.copyWith(
                  color: ColorManager.grey3,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                  borderSide: BorderSide(
                    color: ColorManager.grey3.withOpacity(0.3),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                  borderSide: BorderSide(
                    color: ColorManager.grey3.withOpacity(0.3),
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppSize.s30),
                  borderSide: BorderSide(
                    color: ColorManager.grey3.withOpacity(0.3),
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: AppPadding.p16,
                  vertical: AppPadding.p12,
                ),
              ),
            ),
          ),
          const SizedBox(width: AppSize.s8),
          GestureDetector(
            onTap: controller.sendMessage,
            child: Container(
              width: AppSize.s50,
              height: AppSize.s50,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.primaryColor,
              ),
              child: const Icon(Icons.send, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
