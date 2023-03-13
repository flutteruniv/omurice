import 'package:flutter/material.dart';

class UserBasicInfoListWidget extends StatelessWidget {
  const UserBasicInfoListWidget({
    super.key,
  });

  Widget _userBasicInfoListItem(String label, String value) {
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
    return Column(
      children: [
        _userBasicInfoListItem('ニックネーム', 'みどり'),
        _userBasicInfoListItem('年齢', '非公開'),
        _userBasicInfoListItem('職業', 'お休み中'),
        _userBasicInfoListItem('病気・障害', '発達障害・躁鬱'),
      ],
    );
  }
}
