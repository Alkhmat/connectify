import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'image_state.dart';

class ImageCubit extends Cubit<ImageState> {
  ImageCubit() : super(ImageInitial());
  final picker = ImagePicker();
  Future<void> pickerPhoto() async {
    try {
      final imageData = await picker.pickImage(source: ImageSource.gallery);
      if (imageData != null) {
        emit(ImageLoaded(imageData.path));
      }
    } catch (e) {}
  }

  void reset() {
    emit(ImageInitial());
  }

  Future<void> pickVideo() async {
    try {
      final videoData = await picker.pickVideo(source: ImageSource.gallery);
      if (videoData != null) {
        emit(VideoLoaded(videoData.path));
      }
    } catch (e) {
      // Handle the error if needed
    }
  }

  Future<void> pickMedia() async {
    try {
      final mediaData = await picker.pickImage(
          source:
              ImageSource.gallery); // Вы можете изменить на pickVideo для видео
      if (mediaData != null) {
        final mimeType = mediaData.mimeType;
        if (mimeType != null) {
          if (mimeType.startsWith('image')) {
            emit(ImageLoaded(mediaData.path));
          } else if (mimeType.startsWith('video')) {
            emit(VideoLoaded(mediaData.path));
          }
        }
      }
    } catch (e) {
      // Обработка ошибок при необходимости
    }
  }
}
