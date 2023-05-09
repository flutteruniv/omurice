import 'package:flutter/material.dart';

import '../component/search_widget.dart';
import '../component/service_list.dart';

class ServiceListScreen extends StatelessWidget {
  const ServiceListScreen({Key? key, required this.label}) : super(key: key);
  final String label;

  @override
  Widget build(BuildContext context) {
    final focusNode = FocusNode();
    return DefaultTabController(
      length: 4,
      child: Focus(
        focusNode: focusNode,
        child: GestureDetector(
          onTap: focusNode.requestFocus,
          child: Scaffold(
            appBar: AppBar(
              elevation: 4,
              backgroundColor: Colors.white,
              automaticallyImplyLeading: false,
              // flexibleSpace: const Center(
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(10, 0, 10, 40),
              //     child: SearchWidget(
              //       hint: "キーワードで検索",
              //     ),
              //   ),
              // ),
              bottom: TabBar(
                labelColor: Colors.black,
                labelStyle: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                onTap: (value) => {
                  focusNode.requestFocus(),
                },
                tabs: const [
                  Tab(text: "お金"),
                  Tab(text: "仕事"),
                  Tab(text: "生活"),
                  Tab(text: "健康"),
                ],
              ),
            ),
            body: const TabBarView(
              children: [
                ServiceList(categoryId: 1),
                ServiceList(categoryId: 2),
                ServiceList(categoryId: 3),
                ServiceList(categoryId: 4),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
