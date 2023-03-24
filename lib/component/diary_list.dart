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
    getDiaryDataList(widget.mode).then((dataList) {
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
Future<List<DiaryData>> getDiaryDataList(Mode mode) async {
  switch (mode) {
    case Mode.myself:
      return getMyDiaryList();
    case Mode.follow:
      return getFollowerDiaryList();
    case Mode.timeline:
      return getTimelineDiaryList();
  }
}

Future<List<DiaryData>> getMyDiaryList() async {
  final currentUserID = supabase.auth.currentUser!.id;
  final userData = await supabase
      .from('user')
      .select()
      .eq('user_id', currentUserID)
      .limit(1)
      .single();
  if (userData == null) {
    throw 'No user found';
  }
  final diaryList =
      await supabase.from('diary').select().eq("user_id", userData['id']);
  if (diaryList == null) {
    return [];
  }
  final List<DiaryData> diaryDataList = diaryList.map<DiaryData>((e) {
    return DiaryData(
      userName: userData['user_name'] as String,
      avatarUrl: userData['avatar_url'] as String?,
      diaryKind: e['kind_id'] as int,
      diaryText: e['text'] as String,
      isBookmarked: false,
    );
  }).toList() as List<DiaryData>;
  return diaryDataList;
}

Future<List<DiaryData>> getFollowerDiaryList() async {
  final currentUserID = supabase.auth.currentUser!.id;
  final userData = await supabase
      .from('user')
      .select()
      .eq('user_id', currentUserID)
      .limit(1)
      .single();
  if (userData == null) {
    throw 'No user found';
  }
  var followIds = userData['follow'];
  var diaryList = [];
  for (var id in followIds) {
    final list =
        await supabase.from('diary').select().eq("user_id", int.parse(id));
    diaryList.addAll(list);
  }
  final userList = await supabase.from('user').select();

  final List<DiaryData> diaryDataList = diaryList.map<DiaryData>((diaryItem) {
    var user = userList
        .firstWhere((userItem) => userItem['id'] == diaryItem['user_id']);
    return DiaryData(
      userName: user['user_name'] as String,
      avatarUrl: user['avatar_url'] as String?,
      diaryKind: diaryItem['kind_id'] as int,
      diaryText: diaryItem['text'] as String,
      isBookmarked: false,
    );
  }).toList();
  return diaryDataList;
}

Future<List<DiaryData>> getTimelineDiaryList() async {
  return [];
}
