import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:firebase_storage/firebase_storage.dart';

part 'storage_provider.g.dart';

@riverpod
class Storage extends _$Storage {
  final storage = FirebaseStorage.instance;

  @override
  void build() {}

  void uploadToStorage() {
    // Create a storage reference from our app
    final storageRef = FirebaseStorage.instance.ref();

// Create a reference to "mountains.jpg"
    final mountainsRef = storageRef.child("mountains.jpg");

// Create a reference to 'images/mountains.jpg'
    final mountainImagesRef = storageRef.child("images/mountains.jpg");

// While the file names are the same, the references point to different files
    assert(mountainsRef.name == mountainImagesRef.name);
    assert(mountainsRef.fullPath != mountainImagesRef.fullPath);
  }
}
