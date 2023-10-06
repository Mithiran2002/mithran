import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/popularCard/popularCard_page_view.dart';
import 'package:flutter_application_1/model/menu/menu.dart';

class PopularCard extends StatefulWidget {
final Menu menu;
 @override
  const PopularCard({super.key, required this.menu});
  PopularCardPageView createState() => new PopularCardPageView();
}