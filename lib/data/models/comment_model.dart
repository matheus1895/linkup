class CommentModel {
  final String commentId;
  final String postId;
  final String userId;
  final String username;
  final String userProfileImage;
  final String text;
  final DateTime dateCommented;

  CommentModel({
    required this.commentId,
    required this.postId,
    required this.userId,
    required this.username,
    required this.userProfileImage,
    required this.text,
    required this.dateCommented,
  });

  CommentModel.fromMap(Map<String, dynamic> map) 
    : commentId = map['commentId'],
      postId = map['postId'],
      userId = map['userId'],
      username = map['username'],
      userProfileImage = map['userProfileImage'],
      text = map['text'],
      dateCommented = (map['dateCommented']);

  Map<String, dynamic> toMap() {
    return {
      'commentId': commentId,
      'postId': postId,
      'userId': userId,
      'username': username,
      'userProfileImage': userProfileImage,
      'text': text,
      'dateCommented': dateCommented,
    };
  }
}