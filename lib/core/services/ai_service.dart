import 'dart:developer';
import 'dart:io';

import 'package:ai_chat/core/constant/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class AiService {
  // This would contain API calls to your AI backend

  final _model = GenerativeModel(
    model: 'gemini-2.0-flash',
    apiKey: AppConstant.apiKey,
  );

  Future<String> generateContent(String prompt) async {
    final response = await _model.generateContent([Content.text(prompt)]);
    return response.text!;
  }

  Future<String> generateContentStream(String prompt) async {
    final responses = _model.generateContentStream([Content.text(prompt)]);
    String result = '';
    await for (final response in responses) {
      result += response.text.toString();
    }

    return result;
  }
//generate content from image and text
  Future<String> generateMultiContent() async {
    const prompt = 'what you can see in this image?';
    final imageBytes = await File('download.png').readAsBytes();
    final content = [
      Content.multi([
        TextPart(prompt),
        DataPart('download.png', imageBytes),
      ])
    ];
    final response = await _model.generateContent(content);

    log(response.text.toString());

    return response.text!;
  }
}
