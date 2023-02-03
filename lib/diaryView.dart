import 'package:flutter/material.dart';
import 'package:omurice/component/searchWidget.dart';
import 'package:omurice/diaryList.dart';

class DiaryView extends StatelessWidget {
  const DiaryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return DefaultTabController(
      length: 3,
      child: Focus(
        focusNode: focusNode,
        child: GestureDetector(
          onTap: focusNode.requestFocus,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: const Center(
                child: Padding(
                  padding: EdgeInsets.all(24),
                  child: SearchWidget(
                    hint: "キーワードで検索",
                  ),
                ),
              ),
              bottom: TabBar(
                onTap: (value) => {
                  focusNode.requestFocus(),
                },
                labelColor: Colors.black,
                tabs: const [
                  Tab(text: "自分"),
                  Tab(text: "フォロー"),
                  Tab(text: "タイムライン"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                DiaryList(mode: Mode.myself),
                DiaryList(mode: Mode.follow),
                DiaryList(mode: Mode.timeline),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
