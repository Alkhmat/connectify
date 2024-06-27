import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:developer';

part 'add_content_state.dart';

class AddContentCubit extends Cubit<List<AddContentState>> {
  AddContentCubit() : super([]);

  final picker = ImagePicker();
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final FirebaseStorage storage = FirebaseStorage.instance;

  Future<void> addPhoto() async {
    try {
      final imageData = await picker.pickImage(source: ImageSource.gallery);
      if (imageData != null) {
        final file = File(imageData.path);
        final storageRef = storage.ref().child('photos/${imageData.name}');
        await storageRef.putFile(file);
        final downloadUrl = await storageRef.getDownloadURL();

        final docRef = await firestore.collection('content').add({
          'type': 'photo',
          'url': downloadUrl,
        });

        state.add(AddContentLoaded(docRef.id, downloadUrl));
        emit(List.from(state));
      }
    } catch (e) {
      log('Error adding photo: $e');
    }
  }

  Future<void> addVideo() async {
    try {
      final videoData = await picker.pickVideo(source: ImageSource.gallery);
      if (videoData != null) {
        final file = File(videoData.path);
        final storageRef = storage.ref().child('videos/${videoData.name}');
        await storageRef.putFile(file);
        final downloadUrl = await storageRef.getDownloadURL();

        final docRef = await firestore.collection('content').add({
          'type': 'video',
          'url': downloadUrl,
        });

        state.add(VideoLoaded(docRef.id, downloadUrl));
        emit(List.from(state));
      }
    } catch (e) {
      log('Error adding video: $e');
    }
  }

  void deleteContent(int index) async {
    final content = state[index];
    if (content is AddContentLoaded) {
      await firestore.collection('content').doc(content.id).delete();
    } else if (content is VideoLoaded) {
      await firestore.collection('content').doc(content.id).delete();
    }
    state.removeAt(index);
    emit(List.from(state));
  }

  void reset() {
    emit([]);
  }

  Future<void> loadContent() async {
    try {
      final querySnapshot = await firestore.collection('content').get();
      final List<AddContentState> loadedContent = [];
      for (var doc in querySnapshot.docs) {
        final data = doc.data();
        if (data['type'] == 'photo') {
          loadedContent.add(AddContentLoaded(doc.id, data['url']));
        } else if (data['type'] == 'video') {
          loadedContent.add(VideoLoaded(doc.id, data['url']));
        }
      }
      emit(loadedContent);
    } catch (e) {
      log('Error loading content: $e');
    }
  }
}
