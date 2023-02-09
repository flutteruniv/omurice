import 'package:flutter/material.dart';

class Sample extends StatelessWidget {
  const Sample({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
      ),
    );
  }
}
