class ExplainData {
  const ExplainData({
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
  });

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
}

class ServiceData {
  const ServiceData({
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
