import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<int> {
  HomeCubit() : super(0);

  int _currentIndex = 0;

  int get currentIndex => _currentIndex;

  void changeIndex(int index) {
    _currentIndex = index;
    emit(currentIndex);
  }

  void setInitialIndex(int index) {
    _currentIndex = index;
    emit(currentIndex);
  }
}
