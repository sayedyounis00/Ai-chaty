import 'package:ai_chat/core/services/ai_service.dart';
import 'package:ai_chat/presentation/data/model/message.dart';
import 'package:bloc/bloc.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  final List<Message> _messages = [];
  final List<String> chatHistory = [];
  List<Message> get messages => _messages;

  final bool _isTyping = true;
  bool get isTyping => _isTyping;

  void sendMessage(String prompt) async {
    final String aiResponse = await AiService().generateContent(prompt);
    if (prompt.isNotEmpty) {
      _messages
          .add(Message(text: prompt, isUser: true));
      emit(ResonseLoading());
      _messages.add(
          Message(text: aiResponse, isUser: false));
      emit(AiResponseSent());
    } else {
      return;
    }
  }

  void clearChat() {
    // This would implement chat clearing logic
  }
}
