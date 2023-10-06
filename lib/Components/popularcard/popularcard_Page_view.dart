import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_1/Components/fooddetails/food_detail.dart';
import 'package:flutter_application_1/components/landing%20page/landing_Page_view_model.dart';
import 'package:flutter_application_1/components/popularCard/popularCard_page.dart';
import 'package:flutter_application_1/components/popularCard/popularCard_page_view_model.dart';

class PopularCardPageView extends State<PopularCard>{
  PopularCardPageViewModel ? viewModel;
  PopularCardPageView() {
    viewModel = PopularCardPageViewModel();
  }
  @override
  Widget build(BuildContext context){
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder:(context) =>FoodDetail()));
      },
      child: Stack(
        children: [
        Container(
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.only(right: 20, top: 10, bottom: 10),
          width: MediaQuery.of(context).size.width*.4,
          decoration: BoxDecoration(
            boxShadow: [
               BoxShadow(color: Colors.black38, blurRadius: 4.0),
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            color: Colors.white,
          ),
          child:Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(vertical: 19),
                height: 125,
                width: 125,
                child: Image.network(widget.menu.avatar!),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.menu.title!,
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Rs ${widget.menu.Price!}",
                style:
                    TextStyle(fontWeight: FontWeight.w700, color: Colors.orange),
              ),
            ],
          ),
        ),
        Positioned(
          right:22,
          top: 15,
          child: Icon(Icons.favorite_outline_outlined, color: Colors.orange),
        ),
      ]),
    );
  } 
  }
