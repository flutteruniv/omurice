import 'package:flutter/material.dart';

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
  final int diaryKind;
  final String diaryText;
  final bool isBookmarked;
  final VoidCallback onTapBookmark;
  final String defaultAvatarUrl =
      "https://4.bp.blogspot.com/-pDC6umJH8H4/UbVvXL3PPEI/AAAAAAAAUwE/7IzHI_SmA40/s800/vacation_sunset.png";
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
                        backgroundImage: NetworkImage(
                            avatarUrl != "" ? avatarUrl! : defaultAvatarUrl),
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

Widget getChip(int kind) {
  switch (kind) {
    case 1:
      {
        return Chip(
          label: const Text("五感"),
          backgroundColor: Colors.red[100],
        );
      }
    case 3:
      {
        return Chip(
          label: const Text("過去"),
          backgroundColor: Colors.blue[100],
        );
      }
    case 2:
      {
        return Chip(
          label: const Text("未来"),
          backgroundColor: Colors.amber[100],
        );
      }
    case 4:
      {
        return Chip(
          label: const Text("経験"),
          backgroundColor: Colors.purple[100],
        );
      }
    case 5:
      {
        return Chip(
          label: const Text("自由"),
          backgroundColor: Colors.green[100],
        );
      }
    default:
      {
        return Chip(
          label: const Text("自由"),
          backgroundColor: Colors.green[100],
        );
      }
  }
}
