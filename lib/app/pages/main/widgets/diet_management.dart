import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/chat_input_box.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/human_message.dart';
import 'package:gemini_hackathon/app/pages/main/widgets/item_image_view.dart';
import 'package:gemini_hackathon/app/providers/ai_provider.dart';
import 'package:image_picker/image_picker.dart';

class DietManagement extends ConsumerStatefulWidget {
  const DietManagement({super.key});

  @override
  ConsumerState<DietManagement> createState() => _DietManagementState();
}

class _DietManagementState extends ConsumerState<DietManagement> {
  final ImagePicker picker = ImagePicker();
  final controller = TextEditingController();

  String? searchedText, result;

  List<Uint8List>? images;

  @override
  Widget build(BuildContext context) {
    final gemini = ref.watch(aIProvider.notifier);

    return Column(
      children: [
        if (searchedText != null)
          HumanMessage(
            message: '$searchedText',
            child: ItemImageView(
              bytes: images![0],
            ),
          ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: GeminiResponseTypeView(
                    builder: (context, child, response, loading) {
                      print('loading: $loading');
                      if (loading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }

                      if (response != null) {
                        return Markdown(
                          data: response,
                          selectable: true,
                        );
                      } else {
                        return Container();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (images != null)
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 4),
            alignment: Alignment.centerLeft,
            child: Card(
              child: ListView.builder(
                itemBuilder: (context, index) => ItemImageView(
                  bytes: images!.elementAt(index),
                ),
                itemCount: images!.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
          ),
        ChatInputBox(
          controller: controller,
          onClickCamera: () {
            picker.pickMultiImage().then((value) async {
              final imagesBytes = <Uint8List>[];
              for (final file in value) {
                imagesBytes.add(await file.readAsBytes());
              }

              if (imagesBytes.isNotEmpty) {
                setState(() {
                  images = imagesBytes;
                });
              }
            });
          },
          onSend: () {
            if (controller.text.isNotEmpty) {
              setState(() {
                searchedText = controller.text;
              });
              controller.clear();
              gemini.streamChatMessage(
                userMessage: searchedText!,
                images: images,
              );
              setState(() {
                images = null;
              });
            }
          },
        ),
      ],
    );
  }
}
