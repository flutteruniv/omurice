import 'package:flutter/material.dart';
import 'package:omurice/pages/nav_host.dart';

class TopScreen extends StatelessWidget {
  const TopScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
        image: AssetImage('images/top-background.jpg'),
        fit: BoxFit.cover,
      )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
            height: 80,
          ),
          const Center(
            child: Text(
              'むねをはって',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          const Center(
            child: Text(
              'いきよう',
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black12),
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
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black12),
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
                color: Colors.white,
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black12),
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
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
