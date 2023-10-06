// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuList _$MenuListFromJson(Map<String, dynamic> json) => MenuList(
      menuItem: (json['menuItem'] as List<dynamic>?)
          ?.map((e) => Menu.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenuListToJson(MenuList instance) => <String, dynamic>{
      'menuItem': instance.menuItem,
    };

Menu _$MenuFromJson(Map<String, dynamic> json) => Menu(
      Description: json['Description'] as String?,
      Price: json['Price'] as String?,
      avatar: json['avatar'] as String?,
      title: json['title'] as String?,
    );

Map<String, dynamic> _$MenuToJson(Menu instance) => <String, dynamic>{
      'title': instance.title,
      'Price': instance.Price,
      'Description': instance.Description,
      'avatar': instance.avatar,
    };
