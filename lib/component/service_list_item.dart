import 'package:flutter/material.dart';
import 'package:omurice/model/service_data_model.dart';

import '../pages/service_explain_screen.dart';

class ServiceListItem {
  const ServiceListItem({
    required this.explain_id,
    required this.service_name,
    required this.service_url,
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
  });
  final int explain_id;
  final String? service_name;
  final String? service_url;
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
}

class ExplainListItem extends StatelessWidget {
  const ExplainListItem({
    Key? key,
    required this.id,
    required this.category_id,
    required this.explain_id,
    required this.explain_name,
    required this.explain,
    required this.explain_url,
    required this.service_data,
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
  final int category_id;
  final int explain_id;
  final String explain_name;
  final String explain;
  final String? explain_url;
  final List<ServiceData> service_data;
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
                    explain_name: explain_name,
                    explain: explain,
                    explain_url: explain_url ?? '',
                    service_data: service_data,
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
                  child: Text(explain_name),
                ),
              ],
            ),
            Wrap(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Expanded(child: Text(explain)),
                )
              ],
            )
          ]),
        ),
      ),
    );
  }
}
