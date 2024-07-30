import 'package:flutter_bloc/flutter_bloc.dart';

/// Stores index of active tab.
class BottomNavigationBarCubit extends Cubit<int> {
  BottomNavigationBarCubit() : super(0);

  void changeIndex(int value) => emit(value);
}
