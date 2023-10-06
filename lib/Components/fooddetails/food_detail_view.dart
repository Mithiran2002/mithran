import 'package:flutter/material.dart';
import 'package:flutter_application_1/Components/fooddetails/food_detail.dart';
import 'package:flutter_application_1/Components/fooddetails/food_detail_view_model.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:item_count_number_button/item_count_number_button.dart';

class FoodDetailView extends State<FoodDetail>{
  FoodDetailViewmodel ? viewModel;
  FoodDetailView() {
    viewModel = FoodDetailViewmodel();
  }
  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent,
          elevation: 0.2,
          actions: [
            Container(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.trolley),
            )
          ],
        ),
      body: pageContend(),
          
      );
  }
 Widget pageContend(){
  return Column(
    children: [
      Container(
          child: Image.asset('assets/images/png/chickenbiriyani.png'),  
      ),
      SizedBox(height: 10),
        titleContend(),
    ],
  );
 }
 Widget titleContend(){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10),
            child: Text('Chicken biriyani',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          
        RatingBar.builder(
         initialRating: 3,
         minRating: 1,
         direction: Axis.horizontal,
         allowHalfRating: true,
         itemCount: 5,
         itemPadding: EdgeInsets.symmetric(horizontal:2.0),
         itemSize:15,
         itemBuilder: (context, _) => Icon(
       Icons.star,
        color: Colors.amber,size: 10,
    ),
     onRatingUpdate: (rating) {
      print(rating);
   },
),
SizedBox(width: 5),
Text('('),
Text('62 Rating'),
Text(')'),
          
        ],
      ),
      SizedBox(
        height: 15,
      ),
      Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 15,top: 8),
            child: Text('Rs 199',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
            ),
            SizedBox(width:150),
            ItemCount(
            buttonSizeWidth: 45,
            buttonSizeHeight: 40,
            textStyle: TextStyle(fontSize: 10),
            initialValue: 1,
            minValue: 1,
            maxValue: 10,
            decimalPlaces: 0,
            onChanged: (value) {
    // Handle counter value changes
         print('Selected value: $value');
   },
),
        ],
      ),
      SizedBox(
        height:30,
      ),
      Container(
        padding: EdgeInsets.only(left: 15),
        child: Text('Description',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(
        height: 10
      ),
      Container(
        padding: EdgeInsets.only(left: 20),
        width: MediaQuery.of(context).size.width,
        child: Text(' Chicken Biryani is a delicious savory rice dish that is loaded with spicy marinated chicken, caramelized onions, and flavorful saffron rice.',softWrap: true,),
      ),
      SizedBox(
        height: 10,
      ),
      Row(
        children: [
          Expanded(
          child:Container(
            decoration: BoxDecoration(
              border:Border(
                bottom: BorderSide(
                  color: Colors.black38,
                )
              )
            ),
          )
         ),
        ],
      )
    ],
  );
 }
}