import 'package:flutter/material.dart';

import '../pages/service_introduce_screen.dart';

class ServiceListItem extends StatelessWidget {
  const ServiceListItem({
    Key? key,
    required this.id,
    // required this.created_at,
    required this.name,
    // required this.url,
    required this.thumbnail_url,
    // required this.category_id,
    // required this.max_age,
    // required this.min_age,
    // required this.start_date,
    // required this.end_date,
    // required this.prefecture_id,
    // required this.restriction_id,
    // required this.operator_type_id,
    // required this.occupation_id,
    // required this.income_limit,
    // required this.can_entry,
  }) : super(key: key);

  final int id;
  // final created_at;
  final String name;
  // final String url;
  final String thumbnail_url;
  // final int category_id;
  // final int max_age;
  // final int min_age;
  // final start_date;
  // final end_date;
  // final int prefecture_id;
  // final int restriction_id;
  // final int operator_type_id;
  // final int occupation_id;
  // final int income_limit;
  // final bool can_entry;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ServiceIntroduceScreen(
                    id: id,
                  )),
        );
      },
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(name),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  child: Image.network(thumbnail_url),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("説明"),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
