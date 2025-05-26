class UserModel {
  String? id;
  String? username;
  final String email;
  final String password;
  
  String? profileImageUrl;
  final String? bio;
  final List<String>? followers;
  final List<String>? following;

  UserModel(
    {
    required this.email,
    required this.password,
    this.id,
    this.username, 
    this.profileImageUrl, 
    this.bio, 
    this.followers, 
    this.following
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        email = map['email'],
        password = map['password'],
        profileImageUrl = map['profileImageUrl'],
        bio = map['bio'],
        followers = List<String>.from(map['followers']),
        following = List<String>.from(map['following']);

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
      'followers': followers,
      'following': following,
    };
  }
}