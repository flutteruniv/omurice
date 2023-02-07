import 'package:flutter/material.dart';
import 'package:omurice/component/diaryListItem.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({Key? key, required this.mode}) : super(key: key);

  final Mode mode;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemBuilder: (context, index) {
        return DiaryListItem(
          userName: dummyDiaryDataList[index].userName,
          avatarUrl: dummyDiaryDataList[index].avatarUrl,
          diaryKind: dummyDiaryDataList[index].diaryKind,
          diaryText: dummyDiaryDataList[index].diaryText,
          isBookmarked: dummyDiaryDataList[index].isBookmarked,
          onTapBookmark: () {},
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: dummyDiaryDataList.length,
    );
  }
}

enum Mode {
  myself,
  follow,
  timeline,
}

List<DiaryData> dummyDiaryDataList = makeDummyList();
const dummyDiaryDataListBase = [
  DiaryData(
    userName: "みどり",
    avatarUrl: null,
    diaryKind: DiaryKind.fiveSenses,
    diaryText: "視覚：おいしそうなごはん\n聴覚：楽しい音楽\n触覚：さむい\n味覚：唐揚げおいしい\n嗅覚：？？？？？？？",
    isBookmarked: false,
  ),
  DiaryData(
    userName: "青子",
    avatarUrl: dummyAvatarUrl,
    diaryKind: DiaryKind.myPastSelf,
    diaryText: "過去の自分へ\n\n友達ができないと悩んでいた私へ\n名前が覚えられないほど仲間ができたよ",
    isBookmarked: false,
  ),
  DiaryData(
    userName: "赤太郎",
    avatarUrl:
        "https://2.bp.blogspot.com/-N-arJtghbKE/U2LufzJMYvI/AAAAAAAAfrQ/vNikhC7vEwM/s800/taiiku_cap_red.png",
    diaryKind: DiaryKind.free,
    diaryText: "困っていること\n\nストレス、疲れに気づかない\n完ぺき主義",
    isBookmarked: true,
  ),
  DiaryData(
    userName: "涼風",
    avatarUrl:
        "https://4.bp.blogspot.com/-EgN4TJMFaG8/WK7fDLuYLkI/AAAAAAABCAg/S8QMbWC_6F0Vt9dCg4Scq4jOkeL0bDghgCLcB/s800/mahoutsukai_wind.png",
    diaryKind: DiaryKind.becomeYourFutureSelf,
    diaryText: "未来の自分へ\n\n支援を受けて１年後には自立した生活を送り、就職して働けるようになっていたい",
    isBookmarked: false,
  ),
  DiaryData(
    userName: "西陽",
    avatarUrl:
        "https://4.bp.blogspot.com/-pDC6umJH8H4/UbVvXL3PPEI/AAAAAAAAUwE/7IzHI_SmA40/s800/vacation_sunset.png",
    diaryKind: DiaryKind.serviceUsed,
    diaryText:
        "生活保護相談サービスを利用\n\nカウンセラーの方は今後の指針について親身になって相談に乗ってくれた\n来週一緒に役所に同行してくれることになった",
    isBookmarked: true,
  ),
];

List<DiaryData> makeDummyList() {
  List<DiaryData> list = [];
  for (var i = 0; i < 100; i++) {
    list.addAll(dummyDiaryDataListBase);
  }
  return list;
}

const dummyAvatarUrl =
    "https://1.bp.blogspot.com/-pzkUACogq0E/X5OcHr5ZnSI/AAAAAAABb5Q/xb-j2PQXgu03_vypUL1XNOYv4bhpWEFgQCNcBGAsYHQ/s180-c/bird_mameruriha_inko_blue.png";

class DiaryData {
  const DiaryData({
    required this.userName,
    this.avatarUrl,
    required this.diaryKind,
    required this.diaryText,
    required this.isBookmarked,
  });
  final String userName;
  final String? avatarUrl;
  final DiaryKind diaryKind;
  final String diaryText;
  final bool isBookmarked;
}

enum DiaryKind {
  fiveSenses,
  myPastSelf,
  becomeYourFutureSelf,
  serviceUsed,
  free,
}
