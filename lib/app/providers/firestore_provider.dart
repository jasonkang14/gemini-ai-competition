import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gemini_hackathon/app/models/blood_sugar_level.dart';
import 'package:gemini_hackathon/app/models/diet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@riverpod
Future<List<Diet>> dietList(DietListRef ref) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final eventList = await db.collection('jason_diets').get();

  return eventList.docs.map((doc) => Diet.fromJson(doc.data())).toList();
}

@riverpod
Future<List<BloodSugarLevel>> bloodSugarLevelList(BloodSugarLevelListRef ref, String collectionName) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final eventList = await db.collection('jason_blood_sugar_levels').get();
  return eventList.docs.map((doc) {
    return BloodSugarLevel(level: doc['level'], timestamp: (doc['timestamp'] as Timestamp).toDate());
  }).toList()
    ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
}

@riverpod
Future<Diet> diet(DietRef ref, String timestamp) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final dietDoc = await db.collection('jason_diets').doc(timestamp).get();

  return Diet.fromJson(dietDoc.data()!);
}
