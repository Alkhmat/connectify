part of 'image_cubit.dart';

sealed class ImageState {}

final class ImageInitial extends ImageState {}

final class ImageLoaded extends ImageState {
  final String imagePath;

  ImageLoaded(this.imagePath);
}

final class VideoLoaded extends ImageState {
  final String videoPath;

  VideoLoaded(this.videoPath);
}
