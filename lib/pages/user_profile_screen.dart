import 'package:flutter/material.dart';
import '../component/user_basic_info_list_widget.dart';
import '../component/user_profile_headline.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({
    Key? key,
  }) : super(key: key);

  final String? avatarUrl =
      "https://4.bp.blogspot.com/-pDC6umJH8H4/UbVvXL3PPEI/AAAAAAAAUwE/7IzHI_SmA40/s800/vacation_sunset.png";

  @override
  Widget build(BuildContext context) {
    final double deviceHeight = MediaQuery.of(context).size.height;
    final double deviceWidth = MediaQuery.of(context).size.width;

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
                            backgroundImage: NetworkImage(avatarUrl!),
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
                                child: const Padding(
                                  padding: EdgeInsets.all(20),
                                  child: Center(
                                    child: Text("?????????????????????"),
                                  ),
                                )),
                          )
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      Row(
                        children: [
                          Text("???????????? >"),
                          SizedBox(width: deviceWidth * 0.03),
                          Text("?????????????????? >"),
                        ],
                      ),
                      SizedBox(height: deviceHeight * 0.03),
                      userProfileHeadline("????????????"),
                      Text(
                          "????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????"),
                      SizedBox(height: deviceHeight * 0.03),
                      userProfileHeadline("????????????"),
                      UserBasicInfoListWidget(),
                    ],
                  )),
            ],
          )),
    ));
  }
}
