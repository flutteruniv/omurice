import 'package:flutter/material.dart';
import 'component/bottomIconBar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      bottomNavigationBar: BottomIconBar(), //UIの確認のため、いづれ消す
      body: Container(
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
          )),
    );
  }
}
