import 'package:flutter/material.dart';

class DiaryListItem extends StatelessWidget {
  const DiaryListItem({
    Key? key,
    required this.userName,
    this.avatarUrl,
    required this.diaryText,
    required this.isBookmarked,
    required this.onTapBookmark,
  }) : super(key: key);

  final String userName;
  final String? avatarUrl;
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
            child: IconButton(
              icon: Icon(
                isBookmarked ? Icons.bookmark : Icons.bookmark_border,
              ),
              onPressed: onTapBookmark,
            ),
          ),
        ],
      ),
    );
  }
}
