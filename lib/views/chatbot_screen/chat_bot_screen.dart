import 'package:emergency_time/constants/app_assets/app_assets.dart';
import 'package:emergency_time/widgets/text_widget/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../constants/app_colors/app_colors.dart';
import '../../widgets/common_scaffold/common_scaffold.dart';
import 'chat_bot_screen_controller.dart';

class ChatBotScreen extends StatelessWidget {
  const ChatBotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ChatController>(
      init: ChatController(),
      builder: (chatController) {
        return CommonScaffold(
          appBar: AppBar(
            title: const MyText(
              'AI Assist',
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w400,
            ),
            backgroundColor: AppColors.white,
            iconTheme: const IconThemeData(
              color: Colors.black, // Set the color of the back button to black
            ),
            actions: [Image.asset(AppAssets.onBoarding1).marginAll(5)],
          ),
          body: Column(
            children: <Widget>[
              // Chat Message List
              Expanded(
                child: Obx(() {
                  WidgetsBinding.instance.addPostFrameCallback((_) {
                    if (chatController.scrollController.hasClients) {
                      chatController.scrollController.animateTo(
                        chatController
                            .scrollController.position.maxScrollExtent,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    }
                  });

                  return ListView.builder(
                    controller: chatController.scrollController,
                    padding: const EdgeInsets.all(8.0),
                    itemCount: chatController.messages.length +
                        (chatController.isLoading.value
                            ? 1
                            : 0), // Adjust item count for loading indicator
                    itemBuilder: (context, index) {
                      if (index == chatController.messages.length &&
                          chatController.isLoading.value) {
                        // Show loading indicator if processing
                        return const Padding(
                          padding: EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),
                              MyText(
                                "Processing...",
                                color: Colors.black,
                              ) // Loading text
                            ],
                          ),
                        );
                      }

                      final message = chatController.messages[index];
                      final isUser = message['sender'] == 'user';

                      return Align(
                        alignment: isUser
                            ? Alignment.centerRight
                            : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(12.0),
                          decoration: BoxDecoration(
                            color: isUser
                                ? AppColors.redSplashColor
                                : const Color(0xffF5F8FA),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          constraints: BoxConstraints(
                            maxWidth: MediaQuery.of(context).size.width *
                                0.7, // Limit max width
                          ),
                          child: MyText(
                            message['message']!,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,

                            color: isUser ? Colors.white : Colors.black,
                            maxLines: null, // Allow unlimited lines
                            overflow: TextOverflow.visible, // Allow overflow
                          ),
                        ),
                      );
                    },
                  );
                }),
              ),
              // Message Input and Send Button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: <Widget>[
                    // Message Input Field
                    Expanded(
                      child: Obx(() {
                        chatController.textEditingController.text =
                            chatController.messageController.value;
                        chatController.textEditingController.selection =
                            TextSelection.fromPosition(
                          TextPosition(
                            offset: chatController
                                .textEditingController.text.length,
                          ),
                        );

                        return TextField(
                          controller: chatController.textEditingController,
                          onChanged: (value) {
                            chatController.messageController.value = value;
                          },
                          decoration: InputDecoration(
                            hintText: 'Aa',
                            hintStyle: const TextStyle(color: Colors.black),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 20.0,
                            ),
                            fillColor: const Color(
                                0xffF5F8FA), // Set your desired background color here
                            filled: true, // Enable the filling
                          ),
                          style: const TextStyle(color: Colors.black),
                          textAlignVertical: TextAlignVertical.center,
                        );
                      }),
                    ),
                    // Send Button
                    IconButton(
                      icon: const Icon(
                        Icons.send,
                        color: AppColors.appColor,
                      ),
                      onPressed: () {
                        if (chatController.messageController.value
                            .trim()
                            .isNotEmpty) {
                          // Send message
                          chatController.sendMessage(
                              chatController.messageController.value.trim());

                          // Clear input field after sending
                          chatController.textEditingController.clear();
                          chatController.messageController.value = '';
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
