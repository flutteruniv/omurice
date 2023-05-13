import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_profile_state.freezed.dart';

@freezed
class UserProfileState with _$UserProfileState {
  const factory UserProfileState({
    @Default("") String userId,
    @Default("") String userName,
    @Default("") String avatarUrl,
    @Default("") String age,
    @Default("") String profession,
    @Default("") String disability,
    @Default("") String message,
    @Default("") String selfIntroduce,
    @Default(<String>[]) List<String> follow,
    @Default(<String>[]) List<String> bookmark,
    @Default(false) bool isEdit,
  }) = _UserProfileState;
}
