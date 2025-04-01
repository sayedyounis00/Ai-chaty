// lib/main.dart
import 'package:ai_chat/core/services/ai_service.dart';
import 'package:ai_chat/presentation/cubit/cubit/chat_cubit.dart';
import 'package:ai_chat/presentation/ui/screens/chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AiService().generateMultiContent();
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: MaterialApp(
        title: 'AI Chat Assistant',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: const Color(0xFF6C63FF),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C63FF),
            brightness: Brightness.light,
          ),
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          primaryColor: const Color(0xFF6C63FF),
          colorScheme: ColorScheme.fromSeed(
            seedColor: const Color(0xFF6C63FF),
            brightness: Brightness.dark,
          ),
          fontFamily: 'Poppins',
          useMaterial3: true,
        ),
        themeMode: ThemeMode.system,
        home: const ChatScreen(),
      ),
    );
  }
}
