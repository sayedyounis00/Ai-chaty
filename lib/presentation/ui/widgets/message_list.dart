// File: lib/view/widgets/message_list.dart
import 'package:ai_chat/presentation/cubit/cubit/chat_cubit.dart';
import 'package:ai_chat/presentation/ui/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessageList extends StatefulWidget {
  const MessageList({super.key});

  @override
  State<MessageList> createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    // Make sure to dispose the controller when the widget is removed
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messages = BlocProvider.of<ChatCubit>(context).messages;
    return BlocBuilder<ChatCubit, ChatState>(
      builder: (BuildContext context, state) {
        if (state is AiResponseSent) {
          return messages.isEmpty
              ? Image.asset('assets/images/loading.gif')
              : ListView.builder(
                  padding: const EdgeInsets.all(16),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    return MessageBubble(
                      message: messages[index].text,
                      isUser: messages[index].isUser,
                      timestamp:
                          DateTime.now().subtract(Duration(minutes: index * 5)),
                    );
                  },
                );
        } else {
          return Image.asset('assets/images/loading.gif');
        }
      },
    );
  }
}
