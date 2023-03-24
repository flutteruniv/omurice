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

Future<List<DiaryData>> getDiaryDataList() async {
  final data = await supabase.from('diary_data').select();
  if (data == null) {
    throw 'No data found';
  }
  final userData = await supabase.from('user').select();
  if (userData == null) {
    throw 'No user found';
  }
  final List<DiaryData> diaryDataList = data.map<DiaryData>((e) {
    final user = userData[e['user']];
    return DiaryData(
      userName: user['user_name'] as String,
      avatarUrl: user['avatar_url'] as String?,
      diaryKind: e['diary_kind'] as int,
      diaryText: e['diary_text'] as String,
      isBookmarked: e['is_bookmark'] as bool,
    );
  }).toList() as List<DiaryData>;
  return diaryDataList;
}
