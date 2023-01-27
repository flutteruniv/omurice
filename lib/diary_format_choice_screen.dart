import 'package:flutter/material.dart';
import 'package:omurice/component/diaryFormatItem.dart';

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
        title: const Text("ここに日付を表示する"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: const [
          DiaryFormatItem(label: "五感日記"),
          DiaryFormatItem(label: "過去の自分へ"),
          DiaryFormatItem(label: "未来の自分になりきって"),
          DiaryFormatItem(label: "使ったサービス"),
          DiaryFormatItem(label: "自由に"),
        ],
      ),
    );
  }
}
