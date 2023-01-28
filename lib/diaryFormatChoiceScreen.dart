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

const String fiveSensesDiaryFormat =
    "■視覚で感じたこと\n\n\n■聴覚で感じたこと\n\n\n■臭覚で感じたこと\n\n\n■味覚で感じたこと\n\n\n■触覚で感じたこと\n\n";
const String myPastSelfFormat = "■どの過去の自分に向けて書きたいか\n\n\n■今の自分はどのような感じか\n\n";
const String becomeYourFutureSelfFormat =
    "■未来ではどんな自分になっているか\n\n\n■未来の自分が今の自分にどのように声をかけたいか\n\n";
const String servicesUsedFormat = "■使ったサービス\n\n\n■使ってみてどうだったか\n\n";

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
                  builder: (_) =>
                      const DiaryCreateScreen(format: fiveSensesDiaryFormat),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          DiaryFormatItem(
            label: "過去の自分へ",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const DiaryCreateScreen(format: myPastSelfFormat),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          DiaryFormatItem(
            label: "未来の自分になりきって",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DiaryCreateScreen(
                      format: becomeYourFutureSelfFormat),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          DiaryFormatItem(
            label: "使ったサービス",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) =>
                      const DiaryCreateScreen(format: servicesUsedFormat),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
          DiaryFormatItem(
            label: "自由に",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const DiaryCreateScreen(format: ""),
                  fullscreenDialog: true,
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  String getTodayDate() {
    return DateFormat('yyyy/MM/dd').format(DateTime.now());
  }
}
