import 'dart:typed_data';

import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'ai_provider.g.dart';

@riverpod
class AI extends _$AI {
  @override
  Gemini build() => Gemini.instance;

  void streamChatMessage({
    required String userMessage,
    List<Uint8List>? images = const [],
  }) {
    state.streamGenerateContent(
      userMessage,
      images: images,
      modelName: 'models/gemini-1.5-pro',
      safetySettings: [
        SafetySetting(
          category: SafetyCategory.dangerous,
          threshold: SafetyThreshold.blockLowAndAbove,
        ),
      ],
    ).handleError((e) {
      if (e is GeminiException) {}
    }).listen((value) {});
  }

  Future<String> askWithImage({
    required String userMessage,
    required List<Uint8List> images,
  }) async {
    final result = await state.textAndImage(
      text: userMessage,
      images: images,
      modelName: 'models/gemini-1.5-pro',
    );

    final aiMessage = result?.content?.parts![0].text;

    return aiMessage ?? '';
  }
}
