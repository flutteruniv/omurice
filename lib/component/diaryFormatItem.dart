import 'package:flutter/material.dart';

class DiaryFormatItem extends StatelessWidget {
  const DiaryFormatItem({
    Key? key,
    required this.label,
  }) : super(key: key);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          label,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
      ),
    );
  }
}
