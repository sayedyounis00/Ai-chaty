
import 'package:flutter/material.dart';

class ChatHistoryItem extends StatelessWidget {
  final String title;
  final bool hasMoreOptions;

  const ChatHistoryItem({
    super.key,
    required this.title,
    this.hasMoreOptions = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ListTile(
        dense: true,
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
          ),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: hasMoreOptions
            ? const Icon(Icons.more_horiz, color: Colors.white54)
            : null,
        onTap: () {},
      ),
    );
  }
}
