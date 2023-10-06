import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/fooddetails/food_detail.dart';
import 'package:flutter_application_1/ImageAssets.dart';
import 'package:flutter_application_1/action/login/loginAction.dart';
import 'package:flutter_application_1/components/home%20Page/home_Page_view_model.dart';
import 'package:flutter_application_1/components/landing%20page/landing_Page_view.dart';
import 'package:flutter_application_1/components/login%20page/login_page.dart';
import 'package:flutter_application_1/components/see%20more%20details/see_more_detail_Page.dart';
import 'package:flutter_application_1/model/menu/menu.dart';
import 'package:flutter_application_1/state/appstate.dart';
import 'package:flutter_application_1/state/login/loginstate.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './home_Page.dart';
import './home_Page_view.dart';
import 'package:flutter_application_1/model/User/userprofile.dart';

class HomePageView extends State<HomePage> {
  HomePageViewModel? viewModel;
  HomePageView() {
    viewModel = HomePageViewModel();
  }
  @override
  void initState() {
    super.initState();
    viewModel!.userData = UserProfile.fromJson(viewModel!.jsonObj);
    viewModel!.menuList.menuItem = [];
    viewModel!.menuList = MenuList.fromJson(viewModel!.menuObj);
    print(viewModel!.userData);
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState,LoginState>(
            onInit:(store){
              viewModel!.store1= store;
            },
            converter:(store){
              return store.state.loginState!;
            },
            builder:(context,state){
            return Scaffold(
        resizeToAvoidBottomInset: true,
        drawer: Drawer(
         backgroundColor: Colors.orange,
        child: ListView(
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.orange,
              ),
              accountName: Text(viewModel!.store1?.state.loginState?.userDetail?.email ?? ""),
              accountEmail: Text(viewModel!.store1?.state.loginState?.userDetail?.password ?? ""),
              currentAccountPicture: FlutterLogo(),
            ),
            ListTile(
              leading: Icon(
                Icons.contacts_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Profile',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(color: Colors.white),
            ListTile(
                leading: Icon(
                  Icons.trolley,
                  color: Colors.white,
                ),
                title: const Text(
                  'My Orders',
                  style: TextStyle(fontSize: 15, color: Colors.white),
                ),
                onTap: () {
                  Navigator.pop(context);
                }),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                Icons.privacy_tip_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'Privacy Policy',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                Icons.settings,
                color: Colors.white,
              ),
              title: const Text(
                'Settings',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                Icons.help_outline,
                color: Colors.white,
              ),
              title: const Text(
                'Help',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            Divider(
              color: Colors.white,
            ),
            ListTile(
              leading: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ),
              title: const Text(
                'SignOut',
                style: TextStyle(fontSize: 15, color: Colors.white),
              ),
              onTap: (){
                viewModel!.store1!.dispatch(UserLoginAction(userLogin: null));
                Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context) =>LoginPage()),
                (route) => false);
                
              }
            ),
              
            Divider(color: Colors.white),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 10),
            child: Icon(Icons.trolley, color: Colors.black),
          ),
        ],
        leading: Builder(
            builder: (context) => IconButton(
                  icon: Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
      ),
      body: pageContent(),
    );
            }
    );
  }

  Widget pageContent() {
    return Container(
      child: ListView(
        children: <Widget>[
          titleSection(),
          SizedBox(
            height: 20,
          ),
          filterFoodSection(),
          todayspecialOffer(),
          specialOffer(),
          SizedBox(
            height: 1,
          ),
          popularNowSection(),
        ],
      ),
    );
  }

  Widget popularNowSection() {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Popular Now",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                GestureDetector(
                  onTap: () {
                     Navigator.push(context, MaterialPageRoute(builder: (context) => SeeMoreDetailPage()));
                  },
                  child: Text(
                    "See Full details >>",
                    style: TextStyle(fontSize: 15, color: Colors.orange),
                   
                  )
                )
              ],
            ),
          ),
          SizedBox(
            height: 15,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: viewModel!.menuList.menuItem!
                    .asMap()
                    .map(
                        (key, eachMenu) => MapEntry(key, popularCard(eachMenu)))
                    .values
                    .toList(),
              ),
              //   padding: EdgeInsets.only(left: 10),
              //   child: Row(
              //     children: <Widget>[
              //       popularCard(),
              //       SizedBox(
              //         width: 15,
              //       ),
              //       popularCard(),
              //       SizedBox(
              //         width: 15,
              //       ),
              //       popularCard(),
              //       SizedBox(
              //       width: 15,
              //       ),
              //       popularCard(),
              //       SizedBox(
              //       width: 15,
              //       ),
              //       popularCard(),
              //       SizedBox(
              //       width: 15,
              //       ),
              //     ],
              //   )
            ),
          )
        ],
      ),
    );
  }

  Widget popularCard(Menu eachMenu) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) =>FoodDetail()));
      },
      child: Stack(
        children: [
        Container(
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
          
          decoration: BoxDecoration(
            boxShadow: [
               BoxShadow(color: Colors.black38,blurRadius: 4.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 19),
                height: 125,
                width: 125,
                child: Image.network(eachMenu.avatar!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                eachMenu.title!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rs ${eachMenu.Price!}",
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.orange),
              ),
            ],
          ),
        ),
        Positioned(
          right:22,
          top: 15,
          child: Icon(Icons.favorite_outline_outlined,color: Colors.orange),
        ),
      ]),
    );
  }

  Widget filterFoodSection() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Row(
          children: viewModel!.typesOfFood
              .asMap()
              .map(
                (key, value) => MapEntry(
                  key,
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        viewModel!.selctedFoodType = value;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        boxShadow: [
                          const BoxShadow(color: Colors.black38, blurRadius: 2.0),
                        ],
                        color: viewModel!.selctedFoodType == value
                            ? Colors.orange
                            : Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(16)),
                      ),
                      child: Text(
                        value,
                        style: TextStyle(
                          fontSize: 15,
                          color: viewModel!.selctedFoodType == value
                              ? Colors.white
                              : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              )
              .values
              .toList(),
        ),
      ),
    );
  }

  Widget titleSection() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(boxShadow: <BoxShadow>[
        BoxShadow(
            color: Colors.black54, blurRadius: 15.0, offset: Offset(0.0, 0.75))
      ], color: Colors.white),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          Text(
            "Hello Peoples,",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "What Would you like to",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          Text(
            "eat?",
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          searchBarAndFilter(),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  Widget searchBarAndFilter() {
    return Row(
      children: <Widget>[
        Expanded(
          child: searchBarSection(),
        ),
        filterButton(),
      ],
    );
  }

  Widget searchBarSection() {
    return Center(
      child: Container(
        alignment: Alignment.bottomLeft,
        padding: EdgeInsets.all(6),
        width: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: Colors.white,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            hintText: "Search a Dish Name...",
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.black38,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(30)),
              borderSide: BorderSide(
                color: Colors.black,width: 2.0,
              ),
            ),
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            suffixIcon: Icon(Icons.mic, color: Colors.black),
          ),
        ),
      ),
    );
  }

  Widget filterButton() {
    return Container(
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.all(
          Radius.circular(6),
        ),
      ),
      child: Icon(Icons.filter_list, color: Colors.white),
    );
  }

  Widget specialOffer() {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
      ),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        boxShadow: [
           BoxShadow(color: Colors.black45, blurRadius: 4.0),
        ],
        borderRadius: BorderRadius.all(
          Radius.circular(38),
        ),
        color: Colors.white,
      ),
      child: Row(
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  
                  height: 150,
                  width: 135,
                  child: Image.network('https://img.freepik.com/premium-photo/hamburger-with-splash-liquid-it_579873-1599.jpg',fit: BoxFit.fitHeight ,)
                

                ),
                
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            margin: EdgeInsets.only(top: 3),
            child: Column(
              children: <Widget>[
                Text(
                  "Yummies Special Burger",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Now",
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "₹ 120",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "(20% offer)",
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.orange,blurRadius: 4.0,blurStyle: BlurStyle.outer)
                    ],
                    border: Border.all(color: Colors.orange,width: 2 ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Text(
                    "Add To Card",
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget todayspecialOffer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          margin: EdgeInsets.only(top: 12),
          child: Text(
            "Today's Special Offer",
            style: TextStyle(
                fontSize: 19, fontWeight: FontWeight.w700, color: Colors.black),
          ),
        )
      ],
    );
  }
}
