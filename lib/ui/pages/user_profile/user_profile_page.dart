import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:omurice/model/user_data_model.dart';
import 'package:omurice/ui/pages/user_profile/user_profile_notifier.dart';
import 'component/user_profile_headline.dart';

class UserProfileScreen extends ConsumerWidget {
  const UserProfileScreen({Key? key}) : super(key: key);
  final String defaultAvatarUrl =
      "https://4.bp.blogspot.com/-pDC6umJH8H4/UbVvXL3PPEI/AAAAAAAAUwE/7IzHI_SmA40/s800/vacation_sunset.png";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

    final profileDataConfig = ref.watch(fechProfileFutureProvider);

    final notifier = ref.watch(userProfileNotifierProvider.notifier);
    final state = ref.watch(userProfileNotifierProvider);

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
                          profileDataConfig.when(
                            loading: () => const CircularProgressIndicator(),
                            error: (err, stack) => Text('Error: $err'),
                            data: (config) {
                              return CircleAvatar(
                                radius: deviceWidth * 0.1,
                                backgroundImage: NetworkImage(
                                    config.avatarUrl == ''
                                        ? defaultAvatarUrl
                                        : config.avatarUrl),
                              );
                            },
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
                                    child: state.isEdit == true
                                        ? TextFormField(
                                            controller:
                                                notifier.messageController,
                                          )
                                        : profileDataConfig.when(
                                            loading: () =>
                                                const CircularProgressIndicator(),
                                            error: (err, stack) =>
                                                Text('Error: $err'),
                                            data: (config) {
                                              return Text(config.message);
                                            },
                                          ),
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      userProfileHeadline("自己紹介"),
                      state.isEdit == true
                          ? TextFormField(
                              controller: notifier.selfIntroduceController)
                          : profileDataConfig.when(
                              loading: () => const CircularProgressIndicator(),
                              error: (err, stack) => Text('Error: $err'),
                              data: (config) {
                                return Text(config.selfIntroduce);
                              },
                            ),
                      SizedBox(height: deviceHeight * 0.03),
                      userProfileHeadline("基礎情報"),
                      profileDataConfig.when(
                        loading: () => const CircularProgressIndicator(),
                        error: (err, stack) => Text('Error: $err'),
                        data: (config) {
                          return Column(
                            children: [
                              _userBasicInfoListItem('ニックネーム', config.userName,
                                  notifier.userNameController, state.isEdit),
                              _userBasicInfoListItem(
                                  '年齢',
                                  config.age.toString(),
                                  notifier.ageController,
                                  state.isEdit),
                              _userBasicInfoListItem('職業', config.profession,
                                  notifier.professionController, state.isEdit),
                              _userBasicInfoListItem('病気・障害', config.disability,
                                  notifier.disabilityController, state.isEdit),
                            ],
                          );
                        },
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      state.isEdit == true
                          ? ElevatedButton(
                              onPressed: () async {
                                final inputData = UserData(
                                    userId: "",
                                    userName: notifier.userNameController.text,
                                    avatarUrl:
                                        notifier.avatarUrlController.text,
                                    age: notifier.ageController.text,
                                    profession:
                                        notifier.professionController.text,
                                    disability:
                                        notifier.disabilityController.text,
                                    message: notifier.messageController.text,
                                    selfIntroduce:
                                        notifier.selfIntroduceController.text,
                                    follow: [],
                                    bookmark: []);
                                ref.watch(
                                    updateProfileFutureProvider(inputData));
                                notifier.offIsEdit();
                              },
                              child: const Text("完了"))
                          : ElevatedButton(
                              onPressed: () {
                                notifier.onIsEdit();
                              },
                              child: const Text("編集"))
                    ],
                  )),
            ],
          )),
    ));
  }

  Widget _userBasicInfoListItem(String label, String value,
      TextEditingController controller, bool isEdit) {
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
          isEdit == true
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
