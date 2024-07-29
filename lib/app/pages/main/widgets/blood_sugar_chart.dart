import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gemini_hackathon/app/providers/firestore_provider.dart';

class BloodSugarChart extends ConsumerWidget {
  const BloodSugarChart({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bloodSugarFuture = ref.watch(bloodSugarLevelListProvider('jason_blood_sugar_levels'));

    return const Text('Blood Sugar Chart');
  }
}
