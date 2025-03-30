part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenInitial extends HomeScreenState {}

class SearchLoading extends HomeScreenState {}

class SearchSuccess extends HomeScreenState {
  final List<Surahs> surahs;
  SearchSuccess(this.surahs);
}

class GetQariAudioLoading extends HomeScreenState {}

class GetQariAudioSuccess extends HomeScreenState {
  final List<AudioModel> audioList;
  final bool isPlayed;

  GetQariAudioSuccess(this.audioList, this.isPlayed);
}

class PlayerLoading extends HomeScreenState {}

class GetQariAudioFail extends HomeScreenState {}

class GetFavouriteDataState extends HomeScreenState {
  List<String> data;
  GetFavouriteDataState(this.data);
}

class GetFavouriteDataStateAfter extends HomeScreenState {
  List<String> data;
  GetFavouriteDataStateAfter(this.data);
}

class GetQuranWithTafseerLoading extends HomeScreenState {}

class GetQuranWithTafseerSuccess extends HomeScreenState {
  final List<TafseerModel> tafseerList;
  GetQuranWithTafseerSuccess(this.tafseerList);
}

class GetQuranWithTafseerFail extends HomeScreenState {}
