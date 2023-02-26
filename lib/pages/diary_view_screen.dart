import 'package:flutter/material.dart';
import 'package:omurice/component/diary_list.dart';
import 'package:omurice/component/search_widget.dart';

class DiaryViewScreen extends StatelessWidget {
  const DiaryViewScreen({Key? key}) : super(key: key);

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
              elevation: 4,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              flexibleSpace: const Center(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 0, 20, 30),
                  child: SearchWidget(
                    hint: "キーワードで検索",
                  ),
                ),
              ),
              bottom: TabBar(
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                onTap: (value) => {
                  focusNode.requestFocus(),
                },
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
