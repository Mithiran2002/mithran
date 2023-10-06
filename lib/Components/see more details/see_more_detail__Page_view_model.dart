import 'package:flutter_application_1/model/User/userprofile.dart';
import 'package:flutter_application_1/model/menu/menu.dart';

class SeeMoreDetailPageViewModel{
      
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
        },
       {
          'title':'Veg Manjuriyan',
          'Price': '130',
          'Description':
                        " Veg Manchurian is a tasty Indo Chinese dish of fried veggie balls in a spicy, sweet and tangy sauce.",
           'avatar' :
                    'https://storage.googleapis.com/cscom-2019.appspot.com/uploads/2018/08/Cabbage-Manchurian.jpg',            
        },
        
      ],
    };
}