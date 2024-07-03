import 'package:video_player/video_player.dart';

class VideoState {
  final VideoPlayerController controller;
  final String? error;

  VideoState(this.controller, {this.error});

  factory VideoState.withError(String error) {
    return VideoState(VideoPlayerController.network(''), error: error);
  }
}
