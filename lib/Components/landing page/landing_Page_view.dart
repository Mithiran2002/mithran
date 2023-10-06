// ignore_for_file: dead_code

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/ColorTheme.dart';
import 'package:flutter_application_1/components/home%20Page/home_Page.dart';
import 'package:flutter_application_1/components/landing%20page/landing_Page_view_model.dart';
import './landing_Page_view.dart';
import 'landing_Page.dart';

class LandingPageView extends State<LandingPage> {
  LandingPageViewModel? viewModel;
  LandingPageView() {
    viewModel = LandingPageViewModel();
  }
  int selectedIndex = 2;
  List<Widget> pageContent = [
    Center(
      child: Container(
        alignment: Alignment.center,
        child: Text("Live chat"),
      ),
    ),
    Center(
      child: Text("Profile"),
    ),
    Center(
      child: Text("Home"),
    ),
    Center(
      child: Text("Menu"),
    ),
    Center(
      child: Text("Favourites"),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        height: 45,
        index: selectedIndex,
        backgroundColor: Colors.orange,
        items: <Widget>[
          Icon(Icons.chat, size: 25, color: Colors.black),
          Icon(Icons.contacts, size: 25, color: Colors.black),
          Icon(Icons.home, size: 25, color: Colors.black),
          Icon(Icons.menu_book_rounded, size: 25, color: Colors.black),
          Icon(Icons.favorite_outline, size: 25, color: Colors.black),
        ],
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: switchCaseFun(),
    );
  }

  Widget switchCaseFun() {
    switch (selectedIndex) {
      case 0:
        return Center(
          child: Container(
            child: Text("Live Chat"),
          ),
        );
      case 1:
        return Center(
          child: Container(
            child: Text("Profiles"),
          ),
        );
      case 2:
        return HomePage();

      default:
        return Container();
    }
  }
}
