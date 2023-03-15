import 'package:flutter/material.dart';
import 'package:omurice/model/service_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceIntroduceScreen extends StatelessWidget {
  const ServiceIntroduceScreen(
      {Key? key,
      required this.explain_name,
      required this.explain,
      required this.explain_url,
      required this.service_data})
      : super(key: key);
  final String explain_name;
  final String explain;
  final String explain_url;
  final List<ServiceData> service_data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              explain_name,
              style: TextStyle(fontSize: 20),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              child: Text(explain),
            ),
          ),
          Center(
            child: TextButton(
                onPressed: () async {
                  var url = Uri.parse(explain_url);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("説明サイト")),
          ),
          SizedBox(
            height: 50,
          ),
          Text("関連サービス"),
          Container(
            child: Expanded(
              child: ListView.builder(
                itemCount: service_data.length,
                itemBuilder: (context, index) {
                  return Center(
                    child: Column(children: [
                      service_data[index].service_url != null &&
                              service_data[index].service_name != null
                          ? Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextButton(
                                  onPressed: () async {
                                    var url = Uri.parse(
                                        service_data[index].service_url ?? '');
                                    if (await canLaunchUrl(url)) {
                                      await launchUrl(url);
                                    } else {
                                      throw 'Could not launch $url';
                                    }
                                  },
                                  child: Text(
                                      service_data[index].service_name ?? '')),
                            )
                          : SizedBox()
                    ]),
                  );
                },
              ),
            ),
          )
        ]),
      ),
    );
  }
}
