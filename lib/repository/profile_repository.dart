import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart' as riverpod;

import '../model/user_data_model.dart';

final userProfileRepositoryProvider =
    riverpod.Provider<UserProfileRepository>((ref) => UserProfileRepository());

class UserProfileRepository {
  final supabase = Supabase.instance.client;
  Future<UserData> fechUserProfile() async {
    final currentUserID = supabase.auth.currentUser!.id;
    var data =
        await supabase.from('user').select().eq('user_id', currentUserID);
    if (data == null || data.isEmpty) {
      await supabase.from('user').insert({'user_id': currentUserID});
    }
    data = await supabase
        .from('user')
        .select()
        .eq('user_id', currentUserID)
        .single();
    return UserData(
        userId: data['user_id'],
        userName: data['user_name'],
        avatarUrl: data['avatar_url'],
        age: data['age'],
        profession: data['profession'],
        disability: data['disability'],
        message: data['message'],
        selfIntroduce: data['self_introduce'],
        follow: data['follow'],
        bookmark: data['bookmark']);
  }

  Future updateUserProfile(
    String userName,
    String avatorUrl,
    String age,
    String profession,
    String disability,
    String message,
    String selfIntroduce,
  ) async {
    final supabase = Supabase.instance.client;
    final currentUserID = supabase.auth.currentUser!.id;
    await supabase.from('user').update({
      'user_name': userName,
      'avatar_url': avatorUrl,
      'age': age,
      'profession': profession,
      'disability': disability,
      'message': message,
      'self_introduce': selfIntroduce
    }).match({'user_id': currentUserID});
  }
}
