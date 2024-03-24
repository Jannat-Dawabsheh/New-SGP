import 'dart:convert';

class UserModel{
    final String id;
    final String username;
    final String email;
    final String password;
    final String token ;
    final String imageUrl;

  UserModel({
    required this.id, 
    required this.username, 
    required this.email, 
    required this.password, 
    required this.token, 
    required this.imageUrl
    });


    Map<String, dynamic> toMap() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
      'token':token,
      'imageUrl':imageUrl
    
    };
  }
 
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      username: map['username'] ?? '',
      email: map['email'] ?? '',
      password: map['password'] ?? '',
      token: map['token'] ?? '',
      imageUrl:map['imageUr;']??'',

    );
  }

String toJson()=> json.encode(toMap());
factory UserModel.fomJson(String source) => UserModel.fromMap(json.decode(source));


}