import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@riverpod
Future<List<Map<String, dynamic>>> firestore(FirestoreRef ref, String collectionName) async {
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final eventList = await db.collection(collectionName).get();
  return eventList.docs.map((doc) => doc.data()).toList();
}
