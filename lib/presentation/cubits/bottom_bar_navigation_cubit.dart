import 'package:flutter_bloc/flutter_bloc.dart';



class BottomBarNavigationCubit extends Cubit<int> {


  BottomBarNavigationCubit() : super(0);
  void changeBottomBarIndex(int i) {
    emit(i);
  }
}