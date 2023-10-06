import 'package:json_annotation/json_annotation.dart';
part 'LoginModel.g.dart';
@JsonSerializable()
class UserLogin{
  String? email;
  String? password;
  bool? isRemember;
 UserLogin({this.email,this.password , this.isRemember = false});

  bool validateLoginButton(){
    if (email != null &&
        email!.isNotEmpty &&
        password != null &&
        password!.isNotEmpty) {
        return true;
    } else {
        return false;
    }
  }

  factory UserLogin.fromJson(json) {
    return UserLogin(
      email: json['email'],
      password: json['password'],
      isRemember: json['isRemember'],
    );
  }
  toJson() => {'email':email,'password':password,'isRemember':isRemember};
}