import  'package:flutter/material.dart';
import 'package:flutter_application_1/model/User/userprofile.dart';
import 'package:flutter_application_1/model/menu/menu.dart';
import 'package:flutter_application_1/state/appstate.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/src/store.dart';
class HomePageViewModel {
   Store<AppState>? store1;
   List<String> typesOfFood= ['Meals','Sides','Snacks','Drinks'];
   String selctedFoodType  = "Meals";
   dynamic jsonObj = {
    'name' : 'Mithran',
    'email': 'mithrans518@gmail.com',
    'avatar': ''
   };
   
    UserProfile? userData;
    MenuList menuList = MenuList();
    dynamic  menuObj = {
      "menuItem":[
        {
         'title':'Chicken Biriyani',
         'Price':'199',
         'Description':
           "  Chicken Biryani is a delicious savory rice dish that is loaded with spicy marinated chicken, caramelized onions, and flavorful saffron rice.",
          'avatar' :
                    'https://m.media-amazon.com/images/I/81bz+pmpaSL._AC_UF1000,1000_QL80_.jpg',
        },
        {
          'title':'Grilled Chicken',
          'Price': '299',
          'Description':
                    "This grilled chicken breast recipe is boneless skinless chicken breasts soaked in a garlic and herb marinade, then grilled to perfection.",
           'avatar':
                    'https://www.crozetgazette.com/wp-content/uploads/2022/02/iStock-159120788.jpg',

        },
        {
          'title':'American Shawarma',
          'Price': '250',
          'Description':
                        " chicken shawarma is typically served with garlic sauce, fries, and pickles. The garlic sauce served with the sandwich depends on the meat.",
           'avatar' :
                    'https://img.freepik.com/premium-photo/chicken-shawarma-doner-kebab-burrito-filling-isolated-white-background_116118-2374.jpg?w=2000',

        },
        {
          'title':'Chicken LollyPop',
          'Price': '299',
          'Description':
                        "Chicken lollipop is a popular Indo-Chinese appetizer where a frenched chicken drumette is marinated and then batter fried or baked until crisp.",
           'avatar' :
                    'https://img.freepik.com/premium-photo/chicken-lollipop-is-indian-chinese-appetizer-which-is-frenched-chicken-winglet_466689-77225.jpg?w=2000',            
                      
        },
        {
          'title':'Chicken Tikka Masala',
          'Price': '150',
          'Description':
                        "Chicken tikka masala is a dish consisting of roasted marinated chicken chunks (chicken tikka) in a spiced sauce.",
           'avatar' :
                    'https://img.freepik.com/premium-photo/indian-chicken-tikka-masala-bowl_466689-874.jpg',            
        }

      ],
    };


}
