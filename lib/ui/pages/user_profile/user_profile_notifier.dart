import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omurice/ui/pages/user_profile/user_profile_state.dart';

import '../../../model/user_data_model.dart';
import '../../../repository/profile_repository.dart';

final userProfileNotifierProvider =
    StateNotifierProvider<UserProfileNotifier, UserProfileState>(
  UserProfileNotifier.new,
);

final fechProfileFutureProvider = FutureProvider<UserData>((ref) async {
  final profileDataCongfig =
      await ref.watch(userProfileRepositoryProvider).fechUserProfile();
  return profileDataCongfig;
});

final updateProfileFutureProvider =
    FutureProvider.family<void, UserData>((ref, userData) async {
  await ref.watch(userProfileRepositoryProvider).updateUserProfile(
      userData.userName,
      userData.avatarUrl,
      userData.age,
      userData.profession,
      userData.disability,
      userData.message,
      userData.selfIntroduce);
});

class UserProfileNotifier extends StateNotifier<UserProfileState> {
  UserProfileNotifier(this.ref) : super(const UserProfileState());

  final Ref ref;

  final userNameController = TextEditingController();
  final avatarUrlController = TextEditingController();
  final ageController = TextEditingController();
  final professionController = TextEditingController();
  final disabilityController = TextEditingController();
  final messageController = TextEditingController();
  final selfIntroduceController = TextEditingController();

  void onIsEdit() {
    state = state.copyWith(isEdit: true);
  }

  void offIsEdit() {
    state = state.copyWith(isEdit: false);
  }
}
