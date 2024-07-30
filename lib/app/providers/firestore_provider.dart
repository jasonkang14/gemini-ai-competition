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
  return eventList.docs.map((doc) => BloodSugarLevel.fromJson(doc.data())).toList()
    ..sort((a, b) => a.timestamp.compareTo(b.timestamp));
}

@riverpod
Future<Diet> diet(DietRef ref, String timestamp) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  // final dietDoc = db.collection('jason_diets').doc(timestamp).withConverter<Diet>(
  //       fromFirestore: (snapshot, _) => Diet.fromJson(snapshot.data()!),
  //       toFirestore: (diet, _) => diet.toJson(),
  //     );
  final dietDoc = await db.collection('jason_diets').doc(timestamp).get();
  print('dietDoc: ${dietDoc.data()}');
  // final dietSnapshot = await dietDoc.get();
  // print('dietSnapshot: ${dietDoc.data()}');
  return Diet.fromJson(dietDoc.data()!);
}
