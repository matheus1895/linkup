class UserModel {
  String? id;
  final String username;
  final String email;
  final String password;
  
  String? profileImageUrl;
  String? bio;

  UserModel(
    {
    required this.email,
    required this.password,
    required this.username, 
    this.id,
    this.profileImageUrl, 
    this.bio, 
  });

  UserModel.fromMap(Map<String, dynamic> map)
      : id = map['id'],
        username = map['username'],
        email = map['email'],
        password = map['password'],
        profileImageUrl = map['profileImageUrl'],
        bio = map['bio'];

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'profileImageUrl': profileImageUrl,
      'bio': bio,
    };
  }
}