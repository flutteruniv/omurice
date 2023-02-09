import 'package:flutter/material.dart';

class BottomIconBar extends StatelessWidget {
  const BottomIconBar({
    super.key,
    required this.selectedIndex,
    required this.tabDataList,
  });
  final int selectedIndex;
  final List<TabData> tabDataList;

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: tabDataList
            .map(
              (TabData data) => IconButton(
                  onPressed: data.onPressed,
                  icon: data.icon,
                  color: data.isFocused ? Colors.blue : Colors.grey),
            )
            .toList(),
      ),
    );
  }
}

class TabData {
  const TabData(
      {required this.icon, required this.onPressed, required this.isFocused});
  final Icon icon;
  final VoidCallback? onPressed;
  final bool isFocused;
}
