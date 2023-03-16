import 'package:flutter/material.dart';
import 'package:omurice/model/service_data_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ServiceDetailsScreen extends StatelessWidget {
  const ServiceDetailsScreen(
      {Key? key,
      required this.explainName,
      required this.explain,
      required this.explainUrl,
      required this.serviceData})
      : super(key: key);
  final String explainName;
  final String explain;
  final String explainUrl;
  final List<ServiceData> serviceData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              explainName,
              style: const TextStyle(fontSize: 20),
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
                  var url = Uri.parse(explainUrl);
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: const Text("説明サイト")),
          ),
          const SizedBox(
            height: 50,
          ),
          const Text("関連サービス"),
          Expanded(
            child: ListView.builder(
              itemCount: serviceData.length,
              itemBuilder: (context, index) {
                return Center(
                  child: Column(children: [
                    serviceData[index].serviceUrl != null &&
                            serviceData[index].serviceName != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                                onPressed: () async {
                                  var url = Uri.parse(
                                      serviceData[index].serviceUrl ?? '');
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                },
                                child:
                                    Text(serviceData[index].serviceName ?? '')),
                          )
                        : const SizedBox()
                  ]),
                );
              },
            ),
          )
        ]),
      ),
    );
  }
}
