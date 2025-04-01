// File: lib/view/widgets/chat_input.dart
import 'package:ai_chat/presentation/cubit/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatInput extends StatelessWidget {
  const ChatInput({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ChatCubit>();
    final messageController = TextEditingController();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.attach_file_rounded),
            onPressed: () {},
            color: Theme.of(context).colorScheme.primary,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).brightness == Brightness.light
                    ? Colors.grey[100]
                    : Colors.grey[800],
                borderRadius: BorderRadius.circular(24),
              ),
              child: TextField(
                onChanged: (val) {},
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type your message...',
                  border: InputBorder.none,
                  hintStyle: TextStyle(
                    color: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[500]
                        : Colors.grey[400],
                  ),
                ),
                maxLines: null,
                textInputAction: TextInputAction.newline,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Color(0xFF5A54D1)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(50),
            ),
            child: IconButton(
              icon: const Icon(Icons.send_rounded),
              onPressed: () {
                cubit.sendMessage(
                  messageController.text,
                );
                messageController.clear();
              },
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
