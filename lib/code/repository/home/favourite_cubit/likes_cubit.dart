import 'package:bloc/bloc.dart';

class FavoriteCubit extends Cubit<List<bool>> {
  FavoriteCubit() : super(List.generate(10, (index) => false));

  void toggleFavorite(int index) {
    final newState = List<bool>.from(state);
    newState[index] = !newState[index];
    emit(newState);
  }
}
