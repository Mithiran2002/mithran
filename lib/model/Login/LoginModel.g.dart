// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'LoginModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserLogin _$UserLoginFromJson(Map<String, dynamic> json) => UserLogin(
      email: json['email'] as String?,
      password: json['password'] as String?,
      isRemember: json['isRemember'] as bool? ?? false,
    );

Map<String, dynamic> _$UserLoginToJson(UserLogin instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
      'isRemember': instance.isRemember,
    };
