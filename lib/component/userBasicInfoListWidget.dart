import 'package:flutter/material.dart';

class UserBasicInfoListWidget extends StatelessWidget {
  const UserBasicInfoListWidget({
    super.key,
  });

  Widget userBasicInfoListItem(String label, String value) {
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
          Text(value),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double deviceHeight = MediaQuery.of(context).size.height;

    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: deviceWidth * 0.02, horizontal: deviceHeight * 0.03),
      child: Column(
        children: [
          Container(
            height: 40,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.grey, width: 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('基礎情報'),
              ],
            ),
          ),
          userBasicInfoListItem('ニックネーム', 'みどり'),
          userBasicInfoListItem('年齢', '非公開'),
          userBasicInfoListItem('職業', 'お休み中'),
          userBasicInfoListItem('病気・障害', '発達障害・躁鬱'),
        ],
      ),
    );
  }
}
