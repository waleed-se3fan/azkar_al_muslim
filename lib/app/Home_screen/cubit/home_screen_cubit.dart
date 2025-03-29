import 'dart:convert';

import 'package:azkar_al_muslim/app/Home_screen/home.dart';
import 'package:azkar_al_muslim/data/models/audioauraan.dart';
import 'package:azkar_al_muslim/data/models/models.dart';
import 'package:azkar_al_muslim/data/quraan.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit() : super(HomeScreenInitial());

  static HomeScreenCubit get(context) => BlocProvider.of(context);
  List<Surahs>? data;

  List<Surahs>? getSurahs() {
    data = x.map((e) => Surahs.fromData(e)).toList();
    return data;
  }

  searchForSurahs(String text) {
    emit(SearchLoading());

    List<Surahs> surahs =
        data!.where((element) => element.name.contains(text)).toList();
    emit(SearchSuccess(surahs));
  }

  List<AudioQuraanModel>? audioSurah;
  getQariAudio(qariId) async {
    emit(GetQariAudioLoading());
    try {
      String url = 'https://api.quran.com/api/v4/chapter_recitations/${qariId}';
      Uri uri = Uri.parse(url);
      Response response = await http.get(uri);
      var decoded = jsonDecode(response.body);
      List data = decoded.data['audio_files'];
      audioSurah = data.map((e) => AudioQuraanModel.fromJson(e)).toList();
      emit(GetQariAudioSuccess(audioSurah!));
    } catch (e) {
      emit(GetQariAudioFail());
    }
  }
}
