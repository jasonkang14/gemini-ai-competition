import 'package:cloud_firestore/cloud_firestore.dart';
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
Future<List<Map<String, dynamic>>> bloodSugarLevelList(BloodSugarLevelListRef ref, String collectionName) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final eventList = await db.collection(collectionName).get();
  print('eventList: $eventList');
  return [];
}
