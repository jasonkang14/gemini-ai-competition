import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemini_hackathon/app/models/diet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@riverpod
Future<Diet> diet(DietRef ref, String timestamp) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final dietDoc = await db.collection('jason_diets').doc(timestamp).get();

  return Diet.fromJson(dietDoc.data()!);
}

@riverpod
class Firestore extends _$Firestore {
  @override
  void build() {}

  Future<void> uploadToFirestore({required String imagePath, required String analysis}) async {
    final FirebaseFirestore db = FirebaseFirestore.instance;
    await db.collection('jason_diets').add({
      'image_path': imagePath,
      'analysis': analysis,
      'timestamp': FieldValue.serverTimestamp(), // Add a timestamp
    });
  }
}
