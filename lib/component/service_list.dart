import 'package:flutter/material.dart';
import 'package:omurice/component/service_list_item.dart';
import 'package:omurice/utils/constants.dart';
import '../model/service_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  ServiceListState createState() => ServiceListState();
}

class ServiceListState extends State<ServiceList> {
  List<ExplainData> serviceDataList = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    List<ExplainData> dataList = await getDiaryDataList();
    setState(() {
      serviceDataList = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemBuilder: (context, index) {
        return ExplainListItem(
          id: serviceDataList[index].id,
          categoryId: serviceDataList[index].categoryId,
          explainId: serviceDataList[index].explainId,
          explainName: serviceDataList[index].explainName,
          explain: serviceDataList[index].explain,
          explainUrl: serviceDataList[index].explainUrl,
          serviceData: serviceDataList[index].serviceData,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: serviceDataList.length,
    );
  }

  final supabase = Supabase.instance.client;

  Future<List<ExplainData>> getDiaryDataList() async {
    await refreshSession();
    final data = await supabase
        .from('service')
        .select()
        .eq('category_id', widget.categoryId);
    if (data == null) {
      throw 'No data found';
    }
    final List<ServiceData> serviceDataList = data.map<ServiceData>((element) {
      return ServiceData(
        explainId: element['explain_id'],
        serviceName: element['service_name'],
        serviceUrl: element['service_url'],
      );
    }).toList() as List<ServiceData>;
    final List<ExplainData> dataList = data.map<ExplainData>((element) {
      return ExplainData(
          id: element['id'],
          categoryId: element['category_id'],
          explainId: element['explain_id'],
          explainName: element['explain_name'],
          explain: element['explain'],
          explainUrl: element['explain_url'],
          serviceData: serviceDataList
              .where((data) => data.explainId == element['explain_id'])
              .toList());
    }).toList() as List<ExplainData>;
    final Map<int, ExplainData> dedupedDataMap = {};
    for (final data in dataList) {
      dedupedDataMap[data.explainId] = data;
    }

    final List<ExplainData> dedupedDataList = dedupedDataMap.values.toList();
    return dedupedDataList;
  }
}
