import 'package:flutter/material.dart';

class ServiceIntroduceScreen extends StatelessWidget {
  const ServiceIntroduceScreen({Key? key, required this.id}) : super(key: key);
  final int id; // id でデータベースから情報を取れないかと考えた

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          Text("グループホーム"),
          Image.network(
              'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg'),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
                child: Text(
                    "障害者グループホームは、障害者総合支援法で定められている障害者福祉サービスのひとつです。グループホームの中には入居者の他に、食事・入浴・排泄などの準備やお手伝い、お金の管理等をサポートしてくれるスタッフや、日常生活を送る上での身の回りの介助サポートを行う生活支援員がいるところもあります。アパート、マンション、一戸建て、公営住宅など、拠点の形態はグループホームによって様々です。")),
          ),
          Text("https://works.litalico.jp/column/system/032/"),
          SizedBox(
            height: 50,
          ),
          Text("関連サービス"),
          Text("東京都精神障害者共同ホーム連絡会"),
          Text("https://tokyo-homeren.com/03_annai/"),
          Text("みんなのグルホ"),
          Text("https://minnanoguruho.com/"),
        ]),
      ),
    );
  }
}
