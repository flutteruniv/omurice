import 'package:flutter/material.dart';
import 'package:omurice/pages/diary_format_choice_screen.dart';
import 'package:omurice/pages/diary_view.dart';
import '../component/bottom_icon_bar.dart';
import 'sample_screen.dart';

class NavHost extends StatefulWidget {
  const NavHost({
    super.key,
    required this.title,
    required this.selectedIndex,
  });

  final String title;
  final int selectedIndex;

  @override
  State<NavHost> createState() => _NavHostState();
}

class _NavHostState extends State<NavHost> {
  List<Widget> display = [
    const DiaryFormatChoiceScreen(),
    const DiaryView(),
    const Sample(label: "サービス・支援ページ"),
    const Sample(label: "ユーザーページ")
  ];
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = widget.selectedIndex;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBarShowed(selectedIndex)
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      bottomNavigationBar: BottomIconBar(
        selectedIndex: selectedIndex,
        tabDataList: [
          TabData(
            icon: const Icon(Icons.mode_edit),
            onPressed: () {
              setState(() {
                selectedIndex = 0;
              });
            },
            isFocused: selectedIndex == 0,
          ),
          TabData(
            icon: const Icon(Icons.book),
            onPressed: () {
              setState(() {
                selectedIndex = 1;
              });
            },
            isFocused: selectedIndex == 1,
          ),
          TabData(
            icon: const Icon(Icons.search),
            onPressed: () {
              setState(() {
                selectedIndex = 2;
              });
            },
            isFocused: selectedIndex == 2,
          ),
          TabData(
            icon: const Icon(Icons.home),
            onPressed: () {
              setState(() {
                selectedIndex = 3;
              });
            },
            isFocused: selectedIndex == 3,
          ),
        ],
      ), //UIの確認のため、いづれ消す
      body: display[selectedIndex],
    );
  }

  bool isAppBarShowed(int selectedIndex) {
    return selectedIndex > 1;
  }
}
