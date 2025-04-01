import 'package:ai_chat/presentation/ui/widgets/chat_app_bar.dart';
import 'package:ai_chat/presentation/ui/widgets/chat_input.dart';
import 'package:ai_chat/presentation/ui/widgets/drawer_widget.dart';
import 'package:ai_chat/presentation/ui/widgets/message_list.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            ChatAppBar(scaffoldKey: scaffoldKey),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  image: const DecorationImage(
                    image: AssetImage('assets/images/backG.jpg'),
                    opacity: 0.05,
                    repeat: ImageRepeat.repeat,
                  ),
                ),
                child: const MessageList(),
              ),
            ),
            // const TypingIndicator(),
            const ChatInput(),
          ],
        ),
      ),
      drawer: const SideDrawer(),
    );
  }
}
