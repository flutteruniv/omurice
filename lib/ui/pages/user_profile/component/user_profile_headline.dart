
import 'package:flutter/material.dart';

Widget userProfileHeadline(String title) {
  return Container(
    height: 40,
    decoration: const BoxDecoration(
      border: Border(
        bottom: BorderSide(color: Colors.grey, width: 2),
      ),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title),
      ],
    ),
  );
}
