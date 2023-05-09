import 'package:flutter/material.dart';
import 'package:omurice/utils/constants.dart';
import 'package:omurice/model/user_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'component/user_profile_headline.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  bool _isEdit = false;
  var profileData = const UserData(
      userId: '',
      userName: '',
      avatarUrl: null,
      age: '非公開',
      profession: '',
      disability: '',
      message: '',
      selfIntroduce: '',
      follow: [],
      bookmark: []);
  final String defaultAvatarUrl =
      "https://4.bp.blogspot.com/-pDC6umJH8H4/UbVvXL3PPEI/AAAAAAAAUwE/7IzHI_SmA40/s800/vacation_sunset.png";

  final supabase = Supabase.instance.client;
  Future<UserData> getProfile() async {
    await refreshSession();
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

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    final dataTmp = await getProfile();
    setState(() {
      profileData = dataTmp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;
    final userNameController =
        TextEditingController(text: profileData.userName);
    final avatarUrlController =
        TextEditingController(text: profileData.avatarUrl);
    final ageController = TextEditingController(text: profileData.age);
    final professionController =
        TextEditingController(text: profileData.profession);
    final disabilityController =
        TextEditingController(text: profileData.disability);
    final messageController = TextEditingController(text: profileData.message);
    final selfIntroduceController =
        TextEditingController(text: profileData.selfIntroduce);
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: [
              Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: deviceWidth * 0.02,
                      horizontal: deviceHeight * 0.03),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(
                            radius: deviceWidth * 0.1,
                            backgroundImage: NetworkImage(
                                profileData.avatarUrl == ''
                                    ? defaultAvatarUrl
                                    : profileData.avatarUrl ??
                                        defaultAvatarUrl),
                          ),
                          SizedBox(
                            width: deviceWidth * 0.1,
                          ),
                          Expanded(
                            child: Container(
                                decoration: BoxDecoration(
                                  color: const Color(0xffd9d9d9),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Center(
                                    child: _isEdit == true
                                        ? TextFormField(
                                            controller: messageController,
                                          )
                                        : Text(profileData.message),
                                  ),
                                )),
                          )
                        ],
                      ),
                      // SizedBox(height: deviceHeight * 0.03),
                      // Row(
                      //   children: [
                      //     const Text("フォロー >"),
                      //     SizedBox(width: deviceWidth * 0.03),
                      //     const Text("ブックマーク >"),
                      //   ],
                      // ),
                      SizedBox(height: deviceHeight * 0.03),
                      userProfileHeadline("自己紹介"),
                      _isEdit == true
                          ? TextFormField(controller: selfIntroduceController)
                          : Text(profileData.selfIntroduce),
                      SizedBox(height: deviceHeight * 0.03),
                      userProfileHeadline("基礎情報"),
                      _userBasicInfoListItem(
                          'ニックネーム', profileData.userName, userNameController),
                      _userBasicInfoListItem(
                          '年齢', profileData.age.toString(), ageController),
                      _userBasicInfoListItem(
                          '職業', profileData.profession, professionController),
                      _userBasicInfoListItem('病気・障害', profileData.disability,
                          disabilityController),
                      SizedBox(height: deviceHeight * 0.03),
                      _isEdit == true
                          ? ElevatedButton(
                              onPressed: () async {
                                await refreshSession();
                                await supabase.from('user').update({
                                  'user_name': userNameController.text,
                                  'avatar_url': avatarUrlController.text,
                                  'age': ageController.text,
                                  'profession': professionController.text,
                                  'disability': disabilityController.text,
                                  'message': messageController.text,
                                  'self_introduce': selfIntroduceController.text
                                }).match({'user_id': profileData.userId});
                                loadData();
                                setState(() {
                                  _isEdit = false;
                                });
                              },
                              child: const Text("完了"))
                          : ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _isEdit = true;
                                });
                              },
                              child: const Text("編集"))
                    ],
                  )),
            ],
          )),
    ));
  }

  Widget _userBasicInfoListItem(
      String label, String value, TextEditingController controller) {
    return Container(
      height: 40,
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey, width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          _isEdit == true
              ? Expanded(
                  child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                  child: TextFormField(controller: controller),
                ))
              : Text(value),
        ],
      ),
    );
  }
}
