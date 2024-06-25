import 'package:bloc/bloc.dart';

class BookMarkCubit extends Cubit<List<bool>> {
  BookMarkCubit() : super(List.generate(10, (index) => false));

  void toggleBookMark(int index) {
    final newState = List<bool>.from(state);
    newState[index] = !newState[index];
    emit(newState);
  }
}
