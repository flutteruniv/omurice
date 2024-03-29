import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:omurice/ui/pages/nav_host.dart';
import 'package:omurice/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DiaryCreateScreen extends StatefulWidget {
  const DiaryCreateScreen({
    Key? key,
    required this.kindId,
    required this.format,
  }) : super(key: key);

  final int kindId;
  final String format;

  @override
  State<DiaryCreateScreen> createState() => _DiaryCreateScreenState();
}

class _DiaryCreateScreenState extends State<DiaryCreateScreen> {
  TextEditingController? _controller;
  bool isSaveNeeded = false;
  final supabase = Supabase.instance.client;

  @override
  void initState() {
    _controller = TextEditingController(text: widget.format);
    super.initState();
  }

  Future<bool> insertDiary(String diaryText) async {
    await refreshSession();
    // final userId = supabase.auth.currentUser!.id;
    final user = await supabase
        .from('user')
        .select()
        .eq('user_id', supabase.auth.currentUser!.id)
        .single();
    var now = DateTime.now();
    try {
      await supabase.from('diary').insert({
        'date': "${now.year}-${now.month}-${now.day}",
        'user_id': user['id'],
        'kind_id': widget.kindId,
        'text': diaryText
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(getTodayDate()),
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
            isSaveNeeded
                ? showDialog<void>(
                    context: context,
                    builder: (_) {
                      return const AlertDialogSample();
                    })
                : Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextField(
                      controller: _controller,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                      ),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      onChanged: (value) {
                        setState(() {
                          isSaveNeeded = value.isNotEmpty;
                        });
                      },
                    ),
                  ),
                  // ),
                ),
              ),
              const Divider(
                height: 2,
                color: Colors.black,
              ),
              isSaveNeeded
                  ? SizedBox(
                      width: double.infinity,
                      height: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black12),
                              onPressed: () {},
                              child: const Text(
                                "保存",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.black12),
                              onPressed: () {
                                if (_controller?.text != null) {
                                  insertDiary(_controller!.text)
                                      .then((isSuccess) {
                                    if (isSuccess) {
                                      const snackBar = SnackBar(
                                        content: Text('日記を投稿しました'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                      // 日記一覧画面に移動
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => const NavHost(
                                            title: "",
                                            selectedIndex: 1,
                                          ),
                                        ),
                                      );
                                    } else {
                                      const snackBar = SnackBar(
                                        content: Text('日記の投稿に失敗しました'),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                  });
                                }
                              },
                              child: const Text(
                                "投稿",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : const SizedBox(
                      height: 1,
                    ),
            ],
          ),
        ),
      ),
    );
  }

  String getTodayDate() {
    return DateFormat('yyyy/MM/dd').format(DateTime.now());
  }
}

class AlertDialogSample extends StatelessWidget {
  const AlertDialogSample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('保存されていません'),
      content: const Text('編集中の内容を破棄して日記を閉じますか？'),
      actions: <Widget>[
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'いいえ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        GestureDetector(
          child: const Padding(
            padding: EdgeInsets.all(12),
            child: Text(
              'はい',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
          ),
          onTap: () {
            Navigator.pop(context);
            Navigator.pop(context);
          },
        )
      ],
    );
  }
}
