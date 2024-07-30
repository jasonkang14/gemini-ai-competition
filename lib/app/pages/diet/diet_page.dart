import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DietPage extends ConsumerWidget {
  const DietPage({
    super.key,
    required this.timestamp,
  });

  final String timestamp;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Diet'),
      ),
      body: const Center(
        child: Text('Diet Page'),
      ),
    );
  }
}
