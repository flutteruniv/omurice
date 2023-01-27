import 'package:flutter/material.dart';
import 'package:omurice/component/diaryFormatItem.dart';
import 'package:omurice/diaryFormatChoiceScreen.dart';
import 'component/bottomIconBar.dart';
import 'sampleScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Flutter Demo Home Page',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 0;
  List<Widget> display = [
    const Sample(label: "「日記を見る」ページ"),
    const DiaryFormatChoiceScreen(),
    const Sample(label: "サービス・支援ページ"),
    const Sample(label: "ユーザーページ")
  ];
  bool isAppBarShowed = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: isAppBarShowed
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
              selectedIndex = 0;
              isAppBarShowed = true;
              setState(() {});
            },
            isFocused: selectedIndex == 0,
          ),
          TabData(
            icon: const Icon(Icons.book),
            onPressed: () {
              selectedIndex = 1;
              isAppBarShowed = false;
              setState(() {});
            },
            isFocused: selectedIndex == 1,
          ),
          TabData(
            icon: const Icon(Icons.search),
            onPressed: () {
              selectedIndex = 2;
              isAppBarShowed = true;
              setState(() {});
            },
            isFocused: selectedIndex == 2,
          ),
          TabData(
            icon: const Icon(Icons.home),
            onPressed: () {
              selectedIndex = 3;
              isAppBarShowed = true;
              setState(() {});
            },
            isFocused: selectedIndex == 3,
          ),
        ],
      ), //UIの確認のため、いづれ消す
      body: display[selectedIndex],
    );
  }
}
