// File: lib/view/widgets/message_bubble.dart
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MessageBubble extends StatelessWidget {
  final String message;
  final bool isUser;
  final DateTime timestamp;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isUser,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!isUser) _buildAvatar(),
          const SizedBox(width: 8),
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).brightness == Brightness.light
                        ? Colors.grey[200]
                        : Colors.grey[800],
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: isUser
                      ? const Radius.circular(20)
                      : const Radius.circular(0),
                  bottomRight: isUser
                      ? const Radius.circular(0)
                      : const Radius.circular(20),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
            
                  !isUser
                      ? AnimatedTextKit(
                          animatedTexts: [
                            TypewriterAnimatedText(
                              message,
                              textStyle: const TextStyle(color: Colors.white),

                              speed: const Duration(
                                  milliseconds: 100), 
                            ),
                          ],
                          totalRepeatCount:
                              1, 
                          pause: const Duration(
                              milliseconds: 1000), 
                        )
                      : Text(
                          message,
                          style: TextStyle(
                            color: isUser
                                ? Colors.white
                                : Theme.of(context).brightness ==
                                        Brightness.light
                                    ? Colors.black
                                    : Colors.white,
                          ),
                        ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat('h:mm a').format(timestamp),
                    style: TextStyle(
                      fontSize: 10,
                      color: isUser
                          ? Colors.white.withOpacity(0.7)
                          : Theme.of(context).brightness == Brightness.light
                              ? Colors.black54
                              : Colors.white70,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          if (isUser) _buildReadReceipt(context),
        ],
      ),
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6C63FF), Color(0xFF5A54D1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: const Center(
        child: Icon(
          Icons.auto_awesome,
          color: Colors.white,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildReadReceipt(BuildContext context) {
    return Icon(
      Icons.done_all,
      size: 16,
      color: Theme.of(context).colorScheme.primary,
    );
  }
}
