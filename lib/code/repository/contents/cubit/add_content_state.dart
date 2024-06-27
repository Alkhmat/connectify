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
// part of 'add_content_cubit.dart';

// abstract class AddContentState {}

// class AddContentInitial extends AddContentState {}

// class ContentAdded extends AddContentState {
//   final ContentModel content;
//   ContentAdded(this.content);
// }

// class ContentLoaded extends AddContentState {
//   final List<ContentModel> contents;
//   ContentLoaded(this.contents);
// }

// class ContentError extends AddContentState {
//   final String message;
//   ContentError(this.message);
// }
