import 'package:flutter/material.dart';

class DiaryList extends StatelessWidget {
  const DiaryList({Key? key, required this.mode}) : super(key: key);

  final Mode mode;

  @override
  Widget build(BuildContext context) {
    return Text("");
  }
}

enum Mode {
  myself,
  follow,
  timeline,
}
