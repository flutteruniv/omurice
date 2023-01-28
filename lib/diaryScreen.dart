import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DiaryCreateScreen extends StatefulWidget {
  const DiaryCreateScreen({Key? key}) : super(key: key);

  @override
  State<DiaryCreateScreen> createState() => _DiaryCreateScreenState();
}

class _DiaryCreateScreenState extends State<DiaryCreateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(getTodayDate()),
          foregroundColor: Colors.black,
          backgroundColor: Colors.white,
        ),
        body: Center(
          child: TextField(
            maxLines: null,
          ),
        ));
  }

  String getTodayDate() {
    return DateFormat('yyyy/MM/dd').format(DateTime.now());
  }
}
