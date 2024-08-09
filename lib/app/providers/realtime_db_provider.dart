import 'package:firebase_database/firebase_database.dart';
import 'package:gemini_hackathon/app/models/blood_sugar_level.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'realtime_db_provider.g.dart';

// @riverpod
// Future<List<dynamic>> bloodSugar(BloodSugarRef ref) async {
//   final FirebaseDatabase database = FirebaseDatabase.instance;

//   void processData(Map<String, dynamic> data) {
//     print('data: $data');

//     // Convert the data to a list of BloodSugarLevel objects
//     List<BloodSugarLevel> bloodSugarLevels = data.values.map((e) {
//       return BloodSugarLevel.fromJson(e as Map<String, dynamic>);
//     }).toList();

//     // Now you can use the bloodSugarLevels list
//     print('Blood Sugar Levels: $bloodSugarLevels');
//   }

//   DatabaseReference starCountRef = database.ref('jason/sugar_level');
//   starCountRef.onValue.listen((DatabaseEvent event) {
//     final data = event.snapshot.value;
//     print('data: ${data.toString()}');

//     processData(data);
//     // updateStarCount(data);
//   });

//   return [];

//   // final eventList = await db.collection('jason_diets').get();

//   // return eventList.docs.map((doc) => Diet.fromJson(doc.data())).toList();
// }

@riverpod
Stream<List<BloodSugarLevel>> bloodSugar(BloodSugarRef ref) async* {
  final FirebaseDatabase database = FirebaseDatabase.instance;

  DatabaseReference starCountRef = database.ref('jason/sugar_level');

  await for (DatabaseEvent event in starCountRef.onValue) {
    final data = event.snapshot.value;

    final Map<String, dynamic> dataMap = Map<String, dynamic>.from(data as Map);
    List<BloodSugarLevel> bloodSugarLevels = dataMap.values.map((e) {
      return BloodSugarLevel.fromJson(Map<String, dynamic>.from(e as Map));
    }).toList();
    print('bloodSugarLevels:$bloodSugarLevels');
    yield bloodSugarLevels;
    await Future<void>.delayed(const Duration(seconds: 1));
  }
}
