import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/chat_input_box.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';
import 'package:image_picker/image_picker.dart';

class DietManagement extends ConsumerStatefulWidget {
  const DietManagement({super.key});

  @override
  ConsumerState<DietManagement> createState() => _DietManagementState();
}

class _DietManagementState extends ConsumerState<DietManagement> {
  final ImagePicker picker = ImagePicker();
  final controller = TextEditingController();
  final gemini = Gemini.instance;

  String? searchedText, result;
  bool _loading = false;

  Uint8List? selectedImage;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Text('diet management'),
        ChatInputBox(),
      ],
    );
  }
}
