import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemini_hackathon/app/models/blood_sugar_level.dart';
import 'package:gemini_hackathon/app/models/diet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@riverpod
Future<Diet> diet(DietRef ref, String timestamp) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final dietDoc = await db.collection('jason_diets').doc(timestamp).get();

  return Diet.fromJson(dietDoc.data()!);
}
