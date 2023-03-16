class ExplainData {
  const ExplainData({
    required this.id,
    required this.categoryId,
    required this.explainId,
    required this.explainName,
    required this.explain,
    required this.explainUrl,
    required this.serviceData,
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
  final int categoryId;
  final int explainId;
  final String explainName;
  final String explain;
  final String? explainUrl;
  final List<ServiceData> serviceData;
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
    required this.explainId,
    required this.serviceName,
    required this.serviceUrl,
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
  final int explainId;
  final String? serviceName;
  final String? serviceUrl;
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
