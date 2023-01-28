import 'package:flutter/material.dart';

class Top extends StatelessWidget {
  const Top({
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
            SizedBox(
              height: 80,
            ),
            Center(
                child: Text('むねをはって',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ))),
            Center(
                child: Text('いきよう',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ))),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black12),
                onPressed: () {},
                child: Text("日記を書く",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black12),
                onPressed: () {},
                child: Text("ほかの人の日記を見る",
                    style: TextStyle(
                      color: Colors.white,
                    ))),
            ElevatedButton(
                style:
                    ElevatedButton.styleFrom(backgroundColor: Colors.black12),
                onPressed: () {},
                child: Text("支援制度・サービスを探す",
                    style: TextStyle(
                      color: Colors.white,
                    )))
          ],
        ));
  }
}