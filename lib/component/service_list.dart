import 'package:flutter/material.dart';
import 'package:omurice/component/service_list_item.dart';
import '../model/service_data_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceList extends StatefulWidget {
  const ServiceList({Key? key, required this.categoryId}) : super(key: key);
  final int categoryId;

  @override
  _ServiceListState createState() => _ServiceListState();
}

class _ServiceListState extends State<ServiceList> {
  List<ExplainData> ServiceDataList = [];
  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    List<ExplainData> dataList = await getDiaryDataList();
    setState(() {
      ServiceDataList = dataList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemBuilder: (context, index) {
        return ExplainListItem(
          id: ServiceDataList[index].id,
          category_id: ServiceDataList[index].category_id,
          explain_id: ServiceDataList[index].explain_id,
          explain_name: ServiceDataList[index].explain_name,
          explain: ServiceDataList[index].explain,
          explain_url: ServiceDataList[index].explain_url,
          service_data: ServiceDataList[index].service_data,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: ServiceDataList.length,
    );
  }

  final supabase = Supabase.instance.client;

  Future<List<ExplainData>> getDiaryDataList() async {
    final data = await supabase
        .from('service')
        .select()
        .eq('category_id', widget.categoryId);
    if (data == null) {
      throw 'No data found';
    }
    final List<ServiceData> serviceDataList = data.map<ServiceData>((e) {
      return ServiceData(
        explain_id: e['explain_id'],
        service_name: e['service_name'],
        service_url: e['service_url'],
      );
    }).toList() as List<ServiceData>;
    final List<ExplainData> DataList = data.map<ExplainData>((e) {
      return ExplainData(
          id: e['id'],
          category_id: e['category_id'],
          explain_id: e['explain_id'],
          explain_name: e['explain_name'],
          explain: e['explain'],
          explain_url: e['explain_url'],
          service_data: serviceDataList
              .where((element) => element.explain_id == e['explain_id'])
              .toList());
    }).toList() as List<ExplainData>;
    final Map<int, ExplainData> dedupedDataMap = {};
    DataList.forEach((data) {
      dedupedDataMap[data.explain_id] = data;
    });

    final List<ExplainData> dedupedDataList = dedupedDataMap.values.toList();
    return dedupedDataList;
  }
}
