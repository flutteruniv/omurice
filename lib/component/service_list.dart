import 'package:flutter/material.dart';
import 'package:omurice/component/service_list_item.dart';
import '../model/service_data_model.dart';

class ServiceList extends StatelessWidget {
  const ServiceList({Key? key, required this.mode}) : super(key: key);

  final Mode mode;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
      itemBuilder: (context, index) {
        return ServiceListItem(
          id: dummyServiceDataList[index].id,
          name: dummyServiceDataList[index].name,
          thumbnail_url: dummyServiceDataList[index].thumbnail_url,
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
        );
      },
      itemCount: dummyServiceDataList.length,
    );
  }
}

enum Mode {
  myself,
  follow,
  timeline,
}

List<ServiceData> dummyServiceDataList = makeDummyList();
const dummyServiceDataListBase = [
  ServiceData(
      id: 0,
      name: 'グループホーム',
      thumbnail_url:
          'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
];

List<ServiceData> makeDummyList() {
  List<ServiceData> list = [];
  for (var i = 0; i < 100; i++) {
    list.addAll(dummyServiceDataListBase);
  }
  return list;
}

const dummyAvatarUrl =
    "https://1.bp.blogspot.com/-pzkUACogq0E/X5OcHr5ZnSI/AAAAAAABb5Q/xb-j2PQXgu03_vypUL1XNOYv4bhpWEFgQCNcBGAsYHQ/s180-c/bird_mameruriha_inko_blue.png";
