import 'package:flutter/material.dart';
import '../model/diary_data_model.dart';

class DiaryListItem extends StatelessWidget {
  const DiaryListItem({
    Key? key,
    required this.userName,
    this.avatarUrl,
    required this.diaryKind,
    required this.diaryText,
    required this.isBookmarked,
    required this.onTapBookmark,
  }) : super(key: key);

  final String userName;
  final String? avatarUrl;
  final DiaryKind diaryKind;
  final String diaryText;
  final bool isBookmarked;
  final VoidCallback onTapBookmark;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                avatarUrl != null
                    ? CircleAvatar(
                        backgroundImage: NetworkImage(avatarUrl!),
                      )
                    : CircleAvatar(
                        backgroundColor: Colors.grey,
                        child: Text(
                          userName.isNotEmpty ? userName[0] : "NaN",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                const SizedBox(height: 8),
                Text(
                  userName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
              child: SizedBox(
                width: double.infinity,
                child: Text(
                  diaryText,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                getChip(diaryKind),
                IconButton(
                  icon: Icon(
                    isBookmarked ? Icons.bookmark : Icons.bookmark_border,
                  ),
                  onPressed: onTapBookmark,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget getChip(DiaryKind kind) {
  switch (kind) {
    case DiaryKind.fiveSenses:
      {
        return Chip(
          label: const Text("??????"),
          backgroundColor: Colors.red[100],
        );
      }
    case DiaryKind.myPastSelf:
      {
        return Chip(
          label: const Text("??????"),
          backgroundColor: Colors.blue[100],
        );
      }
    case DiaryKind.becomeYourFutureSelf:
      {
        return Chip(
          label: const Text("??????"),
          backgroundColor: Colors.amber[100],
        );
      }
    case DiaryKind.serviceUsed:
      {
        return Chip(
          label: const Text("??????"),
          backgroundColor: Colors.purple[100],
        );
      }
    case DiaryKind.free:
      {
        return Chip(
          label: const Text("??????"),
          backgroundColor: Colors.green[100],
        );
      }
  }
}
