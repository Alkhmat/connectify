part of 'add_content_cubit.dart';

abstract class AddContentState {}

class AddContentInitial extends AddContentState {}

class AddContentLoaded extends AddContentState {
  final String id;
  final String imagePath;

  AddContentLoaded(this.id, this.imagePath);
}

class VideoLoaded extends AddContentState {
  final String id;
  final String videoPath;

  VideoLoaded(this.id, this.videoPath);
}
