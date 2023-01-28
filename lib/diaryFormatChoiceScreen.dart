import 'package:flutter/material.dart';
import 'package:omurice/component/diaryFormatItem.dart';
import 'package:intl/intl.dart';
import 'package:omurice/diaryScreen.dart';

class DiaryFormatChoiceScreen extends StatefulWidget {
  const DiaryFormatChoiceScreen({Key? key}) : super(key: key);

  @override
  State<DiaryFormatChoiceScreen> createState() =>
      _DiaryFormatChoiceScreenState();
}

class _DiaryFormatChoiceScreenState extends State<DiaryFormatChoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTodayDate()),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: [
          DiaryFormatItem(
            label: "五感日記",
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiaryCreateScreen(),
                    fullscreenDialog: true,
                  ));
            },
          ),
          DiaryFormatItem(
            label: "過去の自分へ",
            onPressed: () {},
          ),
          DiaryFormatItem(
            label: "未来の自分になりきって",
            onPressed: () {},
          ),
          DiaryFormatItem(
            label: "使ったサービス",
            onPressed: () {},
          ),
          DiaryFormatItem(
            label: "自由に",
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  String getTodayDate() {
    return DateFormat('yyyy/MM/dd').format(DateTime.now());
  }
}
