class UserData {
  const UserData({
    required this.userId,
    required this.userName,
    this.avatarUrl,
    required this.age,
    required this.profession,
    required this.disability,
    required this.message,
    required this.selfIntroduce,
    required this.follow,
    required this.bookmark,
  });
  final String userId;
  final String userName;
  final String? avatarUrl;
  final String age;
  final String profession;
  final String disability;
  final String message;
  final String selfIntroduce;
  final List<dynamic> follow;
  final List<dynamic> bookmark;
}
