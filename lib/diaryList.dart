import 'package:flutter/material.dart';
import 'package:omurice/diaryListItem.dart';

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
    diaryText: "視覚：おいしそうなごはん\n聴覚：楽しい音楽\n触覚：さむい\n味覚：唐揚げおいしい\n嗅覚：？？？？？？？",
    isBookmarked: false,
  ),
  DiaryData(
    userName: "青子",
    avatarUrl: dummyAvatarUrl,
    diaryText: "過去の自分へ\n\n友達ができないと悩んでいた私へ\n名前が覚えられないほど仲間ができたよ",
    isBookmarked: false,
  ),
  DiaryData(
    userName: "赤太郎",
    avatarUrl: null,
    diaryText: "困っていること\n\nストレス、疲れに気づかない\n完ぺき主義",
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
    required this.diaryText,
    required this.isBookmarked,
  });
  final String userName;
  final String? avatarUrl;
  final String diaryText;
  final bool isBookmarked;
}
