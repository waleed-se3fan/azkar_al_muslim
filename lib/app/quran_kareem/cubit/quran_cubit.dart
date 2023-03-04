import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'quran_state.dart';

class QuranCubit extends Cubit<QuranState> {
  QuranCubit() : super(QuranInitial());
  static String? surah;

  static List surahList = [];

  static QuranCubit get(context) => BlocProvider.of(context);
  Future getData() async {
    for (int x = 2; x <= 300; x++) {
      String url = 'https://api.mp3quran.net/api/surah?surah=${x}&language=ar';
      var res = await http.get(Uri.parse(url));
      var data = jsonDecode(res.body);
      surah = data['1']['surah_name'];

      surahList.add(surah);
    }
    return surahList;

    // surah = data['surah_name'];
    // return surah;
    emit(GetDataState());
  }
}
