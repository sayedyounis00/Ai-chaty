class Message {
  final String text;
  final bool isUser;
  final DateTime timestamp = DateTime.now();
  final MessageStatus status;

  Message({
    required this.text,
    required this.isUser,
    this.status = MessageStatus.sent,
  });
}

enum MessageStatus { sending, sent, delivered, read, failed }
