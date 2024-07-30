import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';

class DietManagement extends ConsumerWidget {
  const DietManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dietListFuture = ref.watch(dietListProvider);
    return dietListFuture.when(
      data: (dietList) {
        return GridView.builder(
          shrinkWrap: true,
          itemCount: dietList.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, //1 개의 행에 보여줄 item 개수
            childAspectRatio: 1 / 1, //item 의 가로 1, 세로 1 의 비율
            mainAxisSpacing: 10, //수평 Padding
            crossAxisSpacing: 10, //수직 Padding
          ),
          itemBuilder: (BuildContext context, int index) {
            // return Text(index.toString());
            return Image.network(
              dietList[index].imagePath,
              height: 200,
            );
          },
        );
      },
      error: (error, stack) => Text('error: $error'),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
