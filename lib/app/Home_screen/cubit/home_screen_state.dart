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
  final List<AudioQuraanModel> audioList;
  GetQariAudioSuccess(this.audioList);
}

class GetQariAudioFail extends HomeScreenState {}
