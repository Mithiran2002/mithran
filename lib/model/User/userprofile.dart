import 'package:json_annotation/json_annotation.dart';
part 'userprofile.g.dart';
@JsonSerializable()

class UserProfile{
  String? name;
  String? email;
  String? avatar;

  UserProfile({this.avatar,this.email,this.name});

  factory UserProfile.fromJson(json){
     return UserProfile(
      name: json['name'],
      email: json['email'],
      avatar: json['avatar'],
     );
  }
}