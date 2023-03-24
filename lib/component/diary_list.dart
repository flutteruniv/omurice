import 'package:flutter/material.dart';
import 'package:omurice/component/diary_list_item.dart';
import '../model/diary_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DiaryList extends StatefulWidget {
  const DiaryList({Key? key, required this.mode}) : super(key: key);

  final Mode mode;

  @override
  State<DiaryList> createState() => _DiaryListState();
}

class _DiaryListState extends State<DiaryList> {
  List<DiaryData> diaryDataList = [];

  @override
  void initState() {
    super.initState();
    getDiaryDataList().then((dataList) {
      setState(() {
        diaryDataList = dataList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemBuilder: (context, index) {
        return DiaryListItem(
          userName: diaryDataList[index].userName,
          avatarUrl: diaryDataList[index].avatarUrl,
          diaryKind: diaryDataList[index].diaryKind,
          diaryText: diaryDataList[index].diaryText,
          isBookmarked: diaryDataList[index].isBookmarked,
          onTapBookmark: () {},
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: diaryDataList.length,
    );
  }
}

enum Mode {
  myself,
  follow,
  timeline,
}

final supabase = Supabase.instance.client;

// todo Diaryデータを取得し、それを表示用のDiaryDataデータとして適用する
// todo Bookmark管理用のテーブルを用意する
Future<List<DiaryData>> getDiaryDataList() async {
  // final data = await supabase.from('diary_data').select();
  // if (data == null) {
  //   throw 'No data found';
  // }

  // ここでは目的のユーザIDを取得可能にする
  // myself: 自分自身のユーザID
  // follow: フォロワーのユーザID
  // timeline: 全ユーザのユーザID
  final userData = await supabase.from('user').select().eq('id', 5);
  if (userData == null) {
    throw 'No user found';
  }
  final diaryList = await supabase.from('diary').select().eq("user_id", 5);
  if (diaryList == null) {
    // 日記がありませんとトースト通知？もしくは、Centerに表示する方がいい？
  }

  // todo DiaryDataをmapにてリストに変換している -> Diaryを変換する形にする
  final List<DiaryData> diaryDataList = diaryList.map<DiaryData>((e) {
    final user = userData[0]; // user_id - 1 を入れる
    return DiaryData(
      userName: user['user_name'] as String,
      avatarUrl: user['avatar_url'] as String?,
      diaryKind: e['kind_id'] as int,
      diaryText: e['text'] as String,
      // isBookmarked: e['is_bookmark'] as bool,
      // todo ブックマークは、専用のテーブルを用意する必要がある
      isBookmarked: false,
    );
  }).toList() as List<DiaryData>;
  return diaryDataList;
}
