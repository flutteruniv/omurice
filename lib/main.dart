import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:omurice/pages/top.dart';
=======
import 'package:omurice/diaryFormatChoiceScreen.dart';
import 'component/bottomIconBar.dart';
import 'pages/top.dart';
import 'sampleScreen.dart';
>>>>>>> 9d946a9b6f50e555e1218d717578dfd3f8515654

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: const Top(),
    );
  }
}
