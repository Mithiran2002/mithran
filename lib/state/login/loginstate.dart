import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/Login/LoginModel.dart';

class LoginState {
  UserLogin ? userDetail;

  var userData;
  LoginState({this.userDetail});

  factory LoginState.initial(){
    return new LoginState(
      userDetail: null,
    );
  }
  static LoginState fromJson(dynamic json) {
    return LoginState(
      userDetail: json['userDetail']!=null
       ?UserLogin.fromJson(json['userDetail'])
       :null,
    );
  }
  LoginState copyWith({
    UserLogin ? userDetail,

  }){
    this.userDetail = userDetail;
    return this;
  }
   dynamic toJson () => {
    'userDetail':userDetail !=null ? userDetail!.toJson(): null,
  };
  
}