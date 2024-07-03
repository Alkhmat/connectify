import 'package:connectify/code/repository/contents/video/cubit/video_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit(String url)
      : super(VideoState(VideoPlayerController.network(url)));

  Future<void> initialize() async {
    try {
      await state.controller.initialize();
      state.controller.setLooping(true);
      state.controller.play();
      emit(VideoState(state.controller));
    } catch (error) {
      print('Error initializing video player: $error');
      emit(VideoState.withError(error.toString()));
    }
  }

  void play() {
    state.controller.play();
    emit(VideoState(state.controller));
  }

  void pause() {
    state.controller.pause();
    emit(VideoState(state.controller));
  }

  void togglePlayPause() {
    if (state.controller.value.isPlaying) {
      pause();
    } else {
      play();
    }
  }

  @override
  Future<void> close() {
    state.controller.dispose();
    return super.close();
  }
}
