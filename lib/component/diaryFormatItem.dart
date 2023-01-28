import 'package:flutter/material.dart';

class DiaryFormatItem extends StatelessWidget {
  const DiaryFormatItem({
    Key? key,
    required this.label,
    required this.onPressed,
  }) : super(key: key);

  final String label;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: const Color(0xffd9d9d9),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                label,
                style: const TextStyle(
                  fontSize: 24,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
