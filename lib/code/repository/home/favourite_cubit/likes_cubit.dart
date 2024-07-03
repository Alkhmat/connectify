import 'package:bloc/bloc.dart';

class FavoriteCubit extends Cubit<List<bool>> {
  FavoriteCubit()
      : super(List.generate(
            100, (index) => false)); // Увеличьте длину списка до 100

  void toggleFavorite(int index) {
    final newState = List<bool>.from(state);
    if (index >= newState.length) {
      newState.length = index + 1;
      newState[index] = false;
    }
    newState[index] = !newState[index];
    emit(newState);
  }
}
