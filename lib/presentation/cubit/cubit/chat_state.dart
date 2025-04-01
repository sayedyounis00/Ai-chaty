part of 'chat_cubit.dart';

sealed class ChatState {}

final class ChatInitial extends ChatState {}

final class AiResponseSent extends ChatState {}

final class ChatMessageReceived extends ChatState {}

final class ChatError extends ChatState {}

final class ResonseLoading extends ChatState {}

final class ChatEmpty extends ChatState {}
