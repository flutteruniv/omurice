import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omurice/pages/diary_screen.dart';

enum DiaryKind {
  /* 五感日記 */
  fiveSenses(id: 1),
  /* 未来の自分になりきって */
  futureSelf(id: 2),
  /* 過去の自分へ */
  pastSelf(id: 3),
  /* 使ったサービス */
  usedServices(id: 4),
  /* 自由形式 */
  free(id: 5);

  const DiaryKind({required this.id});

  final int id;
}

class DiaryFormatChoiceScreen extends StatefulWidget {
  const DiaryFormatChoiceScreen({Key? key}) : super(key: key);

  @override
  State<DiaryFormatChoiceScreen> createState() =>
      _DiaryFormatChoiceScreenState();
}

const String fiveSensesDiaryFormat =
    "■視覚で感じたこと\n\n\n■聴覚で感じたこと\n\n\n■嗅覚で感じたこと\n\n\n■味覚で感じたこと\n\n\n■触覚で感じたこと\n\n";
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
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 70, 20, 100),
              child: TextButton.icon(
                icon: const Icon(
                  Icons.mode_edit,
                  color: Color.fromRGBO(124, 230, 205, 1),
                ),
                label: const Text(
                  "日記を書く",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black87,
                    decoration: TextDecoration.underline,
                    decorationColor: Color.fromRGBO(124, 230, 205, 1),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => DiaryCreateScreen(
                        kindId: DiaryKind.free.id,
                        format: "",
                      ),
                      fullscreenDialog: true,
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                SizedBox(width: 50),
                Text("特別な日記"),
              ],
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text(
                "五感日記",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(218, 72, 165, 1),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiaryCreateScreen(
                      kindId: DiaryKind.fiveSenses.id,
                      format: fiveSensesDiaryFormat,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text(
                "過去の自分へ",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(218, 72, 165, 1),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiaryCreateScreen(
                      kindId: DiaryKind.pastSelf.id,
                      format: myPastSelfFormat,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text(
                "未来の自分になりきって",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(218, 72, 165, 1),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiaryCreateScreen(
                      kindId: DiaryKind.futureSelf.id,
                      format: becomeYourFutureSelfFormat,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            TextButton(
              child: const Text(
                "使ったサービス",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black87,
                  decoration: TextDecoration.underline,
                  decorationColor: Color.fromRGBO(218, 72, 165, 1),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => DiaryCreateScreen(
                      kindId: DiaryKind.usedServices.id,
                      format: servicesUsedFormat,
                    ),
                    fullscreenDialog: true,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  String getTodayDate() {
    return DateFormat('yyyy/MM/dd').format(DateTime.now());
  }
}
