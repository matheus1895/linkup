class UserModel {
  final String id;
  final String username;
  final String email;
  
  final String? profileImageUrl;
  final String? bio;
  final List<String>? followers;
  final List<String>? following;

  UserModel({
    required this.id, 
    required this.username, 
    required this.email, 
    required this.profileImageUrl, 
    required this.bio, 
    required this.followers, 
    required this.following
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        email = map['email'],
        profileImageUrl = map['profileImageUrl'],
        bio = map['bio'],
        followers = List<String>.from(map['followers']),
        following = List<String>.from(map['following']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }
}