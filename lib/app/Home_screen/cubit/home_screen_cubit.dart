import 'dart:convert';
import 'package:audioplayers/audioplayers.dart';
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

  List<AudioModel>? audioSurah;
  getQariAudio(qariId) async {
    emit(GetQariAudioLoading());
    try {
      String url = 'https://api.quran.com/api/v4/chapter_recitations/${qariId}';
      Uri uri = Uri.parse(url);
      Response response = await http.get(uri);
      var decoded = jsonDecode(response.body);

      List data = decoded['audio_files'];
      print(data);
      audioSurah = data.map((e) => AudioModel.fromJson(e)).toList();

      emit(GetQariAudioSuccess(audioSurah!, false));
    } catch (e) {
      print(e.toString());
      emit(GetQariAudioFail());
    }
  }

  var player = AudioPlayer();
  bool isPlayed = false;
  playAedio(String url) async {
    emit(PlayerLoading());
    if (isPlayed) {
      await player.stop();
    } else {
      await player.play(UrlSource(url));
    }
    isPlayed = !isPlayed;
    emit(GetQariAudioSuccess(audioSurah!, isPlayed)); // Emit بعد التغيير مباشرة
  }

  pauseAudio() async {
    await player.stop();
  }

  //https://quranenc.com/api/v1/translation/sura/arabic_moyassar/114    tafseer
  //https://hadis-api-id.vercel.app/hadith/abu-dawud?page=2&limit=300    ahadeeth
  //https://raw.githubusercontent.com/nawafalqari/azkar-api/56df51279ab6eb86dc2f6202c7de26c8948331c1/azkar.json azkar
  //https://www.hisnmuslim.com/api/ar/27.json azkar alsabah and almasa
  //https://api.aladhan.com/v1/timingsByCity/15-04-2023?city=cairo&country=egypt&method=8 mwaquest alsalah
}
