import 'package:flutter/material.dart';
import 'package:omurice/diaryFormatChoiceScreen.dart';
import 'component/bottomIconBar.dart';
import 'pages/top.dart';
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
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Top(),
    );
  }
}
