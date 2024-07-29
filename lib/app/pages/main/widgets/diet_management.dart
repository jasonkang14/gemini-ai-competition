import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';

class DietManagement extends ConsumerWidget {
  const DietManagement({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dietList = ref.watch(firestoreProvider('jason_diets'));
    print('dietList: $dietList');
    return GridView.count(
      crossAxisCount: 5,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[100],
          child: const Text("He'd have you all unravel at the"),
        ),
        Container(
          padding: const EdgeInsets.all(8),
          color: Colors.teal[200],
          child: const Text('Heed not the rabble'),
        ),
      ],
    );
  }
}
