import 'dart:typed_data';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'storage_provider.g.dart';

@riverpod
class Storage extends _$Storage {
  @override
  void build() {}

  Future<String> uploadToStorage({required Uint8List imageBytes, required String filename}) async {
    final storage = FirebaseStorage.instance;
    final storageRef = storage.ref().child('images/$filename');
    await storageRef.putData(imageBytes);
    final downloadUrl = await storageRef.getDownloadURL(); // Get the download URL
    return downloadUrl; // Return the download URL
  }
}
