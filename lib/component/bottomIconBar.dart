import 'package:flutter/material.dart';

class BottomIconBar extends StatelessWidget {
  const BottomIconBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(onPressed: () {}, icon: Icon(Icons.mode_edit)),
          IconButton(onPressed: () {}, icon: Icon(Icons.book)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.home)),
        ],
      ),
    );
  }
}
