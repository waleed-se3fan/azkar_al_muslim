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
