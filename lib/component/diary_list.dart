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

// Modeに応じて取得するリストを切り替える

// getMyDiaryList() : 自分自身の日記データを取得
// getFollowerDiaryList() : フォロワーの日記データを取得
// getAnyoneDiaryList() : タイムライン

Future<List<DiaryData>> getMyDiaryList() async {
  return [];
}

Future<List<DiaryData>> getFollowerDiaryList() async {
  return [];
}

Future<List<DiaryData>> getAnyoneDiaryList() async {
  return [];
}

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

  // ユーザIDを取得する
  final currentUserID = supabase.auth.currentUser!.id;

  // ユーザIDを検索キーにして該当するuser情報を取得する
  final userData = await supabase
      .from('user')
      .select()
      .eq('user_id', currentUserID)
      .limit(1)
      .single();
  if (userData == null) {
    throw 'No user found';
  }

  // user情報からuser_idを取り出して、userName, avatarUrlを設定する

  final diaryList =
      await supabase.from('diary').select().eq("user_id", userData['id']);
  if (diaryList == null) {
    return [];
  }

  // todo DiaryDataをmapにてリストに変換している -> Diaryを変換する形にする
  final List<DiaryData> diaryDataList = diaryList.map<DiaryData>((e) {
    return DiaryData(
      userName: userData['user_name'] as String,
      avatarUrl: userData['avatar_url'] as String?,
      diaryKind: e['kind_id'] as int,
      diaryText: e['text'] as String,
      // isBookmarked: e['is_bookmark'] as bool,
      // todo ブックマークは、専用のテーブルを用意する必要がある
      isBookmarked: false,
    );
  }).toList() as List<DiaryData>;
  // todo リストの項目を作成時刻に対して降順に並び替える
  return diaryDataList;
}
