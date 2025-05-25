class PostModel {
  final String postId;
  final String userId;
  final String username;
  final String imageUrl;
  final DateTime datePosted;
  final List<String> likes;

  final String? caption;
  final String? userProfileImage;

  PostModel({
    required this.postId,
    required this.userId,
    required this.username,
    required this.userProfileImage,
    required this.imageUrl,
    required this.caption,
    required this.datePosted,
    required this.likes,
  });

  PostModel.fromMap(Map<String, dynamic> map) 
      : postId = map['postId'],
        userId = map['userId'],
        username = map['username'],
        userProfileImage = map['userProfileImage'],
        imageUrl = map['imageUrl'],
        caption = map['caption'],
        datePosted = map['datePosted'],
        likes = List<String>.from(map['likes']);

  Map<String, dynamic> toMap() {
    return {
      'postId': postId,
      'userId': userId,
      'username': username,
      'userProfileImage': userProfileImage,
      'imageUrl': imageUrl,
      'caption': caption,
      'datePosted': datePosted,
      'likes': likes,
    };
  }
}
