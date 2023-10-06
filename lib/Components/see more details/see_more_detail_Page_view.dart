import 'package:flutter/material.dart';
import 'package:flutter_application_1/components/popularCard/popularCard_page.dart';
import 'package:flutter_application_1/components/see%20more%20details/see_more_detail_Page.dart';
import 'package:flutter_application_1/components/see%20more%20details/see_more_detail__Page_view_model.dart';
import 'package:flutter_application_1/model/menu/menu.dart';
class SeeMoreDetailPageView extends State<SeeMoreDetailPage>{
  SeeMoreDetailPageViewModel? viewModel;
  SeeMoreDetailPageView (){
    viewModel = SeeMoreDetailPageViewModel(); 
  }
  String chosenTab = 'Meals';
  bool isRemember = false;
  TabController ? tabController;
  @override
  void initState(){
    super.initState();
     viewModel!.menuList.menuItem = [];
     viewModel!.menuList = MenuList.fromJson(viewModel!.menuObj);
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar:AppBar(
      title:Align(alignment: Alignment.topLeft,
      child:Text("Our Menu",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
      ),
      
        backgroundColor:Colors.white,
        shadowColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            child: Icon(Icons.trolley),
          )
        ],
      ),
    
      body:tabSection(),
  
     );

  }
  Widget tabSection(){
    return Container(
      child: Column(
       children: <Widget>[
         Container(
          height: 40,
           child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
             child: Row(
               children: <Widget>[
                 GestureDetector(
                   onTap: () {
                     onTabchange("Meals");
                   },
                   child:Container(
                     alignment: Alignment.bottomCenter,
                     width: (MediaQuery.of(context).size.width - 40) / 4,
                     padding: EdgeInsets.symmetric(vertical: 7,),
                     decoration: BoxDecoration(
                       border:Border(
                         bottom:BorderSide(
                           color: chosenTab == "Meals" ? Colors.orange : Colors.white,
                         ),
                       ),
                     ),
                     child: Text("Meals",
                        style: TextStyle(color: chosenTab == "Meals" ? Colors.orange :Colors.orange[300],fontSize: 20,fontWeight: FontWeight.bold),
                     ),
                   ),
                 ),
                 SizedBox(
                   width: 25,
                 ),
                GestureDetector(
                 onTap: () {
                   onTabchange("Sides");
                 },
                 child: Container(
                   alignment:Alignment.bottomCenter,
                   width: (MediaQuery.of(context).size.width - 40) /4,
                   padding:EdgeInsets.symmetric(vertical:7,horizontal: 15),
                   decoration: BoxDecoration(
                     border: Border(
                       bottom: BorderSide(
                         color: chosenTab == "Sides" ? Colors.orange : Colors.white,
                       )
                     )
                   ),
                    child: Text("Sides",
                        style: TextStyle(color: chosenTab == "Sides" ? Colors.orange :Colors.orange[300],fontSize: 20,fontWeight: FontWeight.bold),
                     ),
                 ),
                ),
                SizedBox(
                 width: 20,
                ),
                GestureDetector(
                 onTap: () {
                   onTabchange("Snacks");
                 },
                 child:Container(
                       alignment: Alignment.center,
                       width: (MediaQuery.of(context).size.width - 40) / 4,
                       padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                       decoration: BoxDecoration(
                     border: Border(
                       bottom: BorderSide(
                         color: chosenTab == "Snacks" ? Colors.orange : Colors.white,
                       ),
                     ),
                   ),
                   child: Text(
                     "Snacks",
                     style: TextStyle(color: chosenTab == "Snacks" ? Colors.orange : Colors.orange[300],fontSize: 20,fontWeight:FontWeight.bold),
                   ),
                 ),
                ),
                SizedBox(
                 width: 20,
                ),
                GestureDetector(
                 onTap: () {
                   onTabchange("Drinks");
                 },
                 child: Container(
                   alignment: Alignment.center,
                   width: (MediaQuery.of(context).size.width -40)/4,
                   padding: EdgeInsets.symmetric(vertical: 7,horizontal: 10),
                   decoration: BoxDecoration(
                     border: Border(
                       bottom: BorderSide(
                         color: chosenTab == "Drinks" ? Colors.orange : Colors.white,
                       )
                     )
                   ),
                   child:Text(
                     "Drinks",
                     style: TextStyle(color:chosenTab == "Drinks" ? Colors.orange : Colors.orange[300],fontSize: 20,fontWeight: FontWeight.bold),
                   )
                 ),
                ),
               ],
             ),
           ),
         ),
         Expanded(
           child: SingleChildScrollView(
             child: chosenTab == "Meals"? mealsOption() :chosenTab == "Sides"? sidesOption() :chosenTab == "Snacks"? snacksOption() : drinksOption(),
           ),
         ),
       ],
            ),
    );
    }

  onTabchange(String selectedTab){
    setState(() {
      chosenTab = selectedTab;
      
    });
     

   
  }
  Widget mealsOption(){
    return Container(
      child: Container(
         width:MediaQuery.of(context).size.width,
          child: Column(
            children:<Widget>[
             SizedBox(
            height: 15,
            ),
           Container(
                child: Wrap(
                  alignment: WrapAlignment.start,
                  children: viewModel!.menuList.menuItem!
                      .asMap()
                      .map(
                          (key, eachMenu) => MapEntry(key, Container(child: PopularCard(menu: eachMenu,),)))
                      .values
                      .toList(),
                  ),
                ),
            ],
          ),
        ),
    );
    }
    Widget drinksOption() {
    return Container(
      width:MediaQuery.of(context).size.width,
        child: Column(
          children:<Widget>[
           SizedBox(
          height: 15,
          ),
         Container(
              child: Wrap(
                alignment: WrapAlignment.start,
                children: viewModel!.menuList.menuItem!
                    .asMap()
                    .map(
                        (key, eachMenu) => MapEntry(key, Container(child: PopularCard(menu: eachMenu,),)))
                    .values
                    .toList(),
                ),
              ),
          ],
        ),
    );
  }
   snacksOption() {
  }
  
  sidesOption() {
  }
  
  }
  

  
   
  
 
 




