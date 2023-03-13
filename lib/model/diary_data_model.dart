class DiaryData {
  const DiaryData({
    required this.userName,
    this.avatarUrl,
    required this.diaryKind,
    required this.diaryText,
    required this.isBookmarked,
  });
  final String userName;
  final String? avatarUrl;
  final int diaryKind;
  final String diaryText;
  final bool isBookmarked;
}
