import 'package:flutter/material.dart';
import 'package:omurice/pages/nav_host.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: const EdgeInsets.all(32.0),
          child: Container(width: 100, child: Image.asset('images/icon.png')),
        ),
        const Center(
          child: Text(
            'むねをはって',
            style: TextStyle(
                color: Color.fromRGBO(124, 230, 205, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        const Center(
          child: Text(
            'いきよう',
            style: TextStyle(
                color: Color.fromRGBO(124, 230, 205, 1),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NavHost(
                  title: "",
                  selectedIndex: 0,
                ),
              ),
            );
          },
          child: const Text(
            "日記を書く",
            style: TextStyle(
              color: Colors.black87,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromRGBO(124, 230, 205, 1),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NavHost(
                  title: "",
                  selectedIndex: 1,
                ),
              ),
            );
          },
          child: const Text(
            "ほかの人の日記を見る",
            style: TextStyle(
              color: Colors.black87,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromRGBO(124, 230, 205, 1),
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => const NavHost(
                  title: "",
                  selectedIndex: 2,
                ),
              ),
            );
          },
          child: const Text(
            "支援制度・サービスを探す",
            style: TextStyle(
              color: Colors.black87,
              decoration: TextDecoration.underline,
              decorationColor: Color.fromRGBO(124, 230, 205, 1),
            ),
          ),
        )
      ],
    );
  }
}
