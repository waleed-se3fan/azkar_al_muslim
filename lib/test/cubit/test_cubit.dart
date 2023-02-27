import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../test.dart';

part 'test_state.dart';

class TestCubit extends Cubit<TestState> {
  TestCubit() : super(TestInitial());
  static TestCubit get(context) => BlocProvider.of(context);

  List<String> items = [];

  String text = '';

  int index = 0;

  void Bnb(i) {
    index = i;
    emit(BottomNavigationState());
  }

  void Atol() {
    items.add(text);
    emit(AddToListState());
  }
}
