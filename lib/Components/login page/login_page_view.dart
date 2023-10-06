import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/action/login/loginAction.dart';
import 'package:flutter_application_1/components/landing%20page/landing_Page.dart';
import 'package:flutter_application_1/state/appstate.dart';
import 'package:flutter_application_1/state/login/loginstate.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../Theme/ColorTheme.dart';
import './login_page_view_model.dart';
import 'login_page.dart';

class LoginPageView extends State<LoginPage> {
  LoginPageViewModel? viewModel;
  LoginPageView() {
    viewModel = LoginPageViewModel();
  }
  String chosenTab = "signIn";

  bool isRemember = false;
  bool obscureText = true;
  
  @override
  void initState() {
    super.initState();
    viewModel!.loginButtonBuilder = StreamController<dynamic>.broadcast();
  }
   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          
          resizeToAvoidBottomInset: false,
          body:
           StoreConnector<AppState,LoginState>(
            onInit:(store){
              viewModel!.store1 = store;
            },
            converter:(store){
              return store.state.loginState!;
            },
            builder:(context,state){
              return pageContent();
            }
          ),
    );
  }

  Widget pageContent() {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
      image: DecorationImage(image: AssetImage("assets/images/png/backround image.jpg"),fit: BoxFit.cover),
      
      ),
      
      child: new BackdropFilter(
      filter: new ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
        child: new Container(
          decoration: new BoxDecoration(color: Colors.white.withOpacity(0.0)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              signorsignupSection(),
              SizedBox(
                height: 15,
              ),
              othersignInoption(),
              
            ],
          ),
        ),
      ),
    );
  }

 

  Widget signorsignupSection() {
    return Container(
        child: Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: tabSection(),
    ));
  }

  Widget tabSection() {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  onTabchange("signIn");
                },
                child: Container(
                  alignment: Alignment.center,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: chosenTab == "signIn"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                  child: Text(
                    "SignIn",
                    style: TextStyle(
                      color: chosenTab == "signIn"
                          ? Colors.orange
                          : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  onTabchange("signUp");
                },
                child: Container(
                  alignment: Alignment.bottomCenter,
                  width: (MediaQuery.of(context).size.width - 40) / 2,
                  padding: EdgeInsets.symmetric(vertical: 6),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: chosenTab == "signUp"
                            ? Colors.orange
                            : Colors.white,
                      ),
                    ),
                  ),
                  child: Text(
                    "SignUp",
                    style: TextStyle(
                      color: chosenTab == "signUp"
                          ? Colors.orange
                          : Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
          Container(
            child: chosenTab == "signIn" ? signInSection() : signupSection(),
          )
        ],
      ),
    );
  }

  Widget signInSection() {
    return Container(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 30,
          ),
          TextField(
            style: TextStyle(color: Colors.white),
            onChanged: (value) {
              viewModel!.userData.email = value;
              viewModel!.loginButtonBuilder.add("mithran@123");
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'E-mail address',
              hintText: 'Enter youre E-mail address',
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
             
             
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
                borderSide: BorderSide(color: Colors.white,width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
                borderSide: BorderSide(color: Colors.white,width: 3.0),
              ),
            ),
          ),
          SizedBox(
            height: 30,
          ),
          TextField(
           style: TextStyle(color: Colors.white),
            onChanged: (value) {
              viewModel!.userData.password = value;
              viewModel!.loginButtonBuilder.add("mithran1234");
            },
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: "Enter Password",
              hintText: "Enter Youre Password",
              labelStyle: TextStyle(color: Colors.white),
              hintStyle: TextStyle(color: Colors.white),
               suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(obscureText ? Icons.visibility_off_outlined: Icons.visibility_outlined),
                color: Colors.white,
               ),
              enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.all(
                Radius.circular(28), ),
                borderSide: BorderSide(color: Colors.white,width: 1.0),
              ),
             
              focusedBorder: OutlineInputBorder(
                
                borderRadius: BorderRadius.all(Radius.circular(28),),
                borderSide: BorderSide(color: Colors.white,width: 3.0),
                
              ),
            ),
            obscureText:true,
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            alignment: Alignment.centerRight,
            child: Text(
              "Forget Password?",
              style: TextStyle(color: Colors.white),
            ),
          ),
          checkboxSection(),
          loginButton(),
        ],
      ),
    );
  }

  Widget loginButton() {
    return StreamBuilder<dynamic>(
        stream: viewModel!.loginButtonBuilder.stream,
        builder: (context, snapshot) {
          return GestureDetector(
            onTap: () {
              if (viewModel!.userData.validateLoginButton()) {
                 viewModel!.store1!.dispatch(UserLoginAction(userLogin: viewModel!.userData!));
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LandingPage()));
              }
            },
            child: Container(
              
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(28),
                ),
                color: viewModel!.userData.validateLoginButton()
                    ? Colors.orange
                    : ColorTheme.colorTheme.darkGrey),
                  
                 child: AnimatedPadding(
                      padding: viewModel!.userData.validateLoginButton()
                      ? EdgeInsets.symmetric(vertical:15,horizontal:50)
                      : EdgeInsets.symmetric(vertical: 10,horizontal: 15),
                      duration: Duration(milliseconds:550),
                   child: AnimatedDefaultTextStyle(
                       duration: Duration(milliseconds:650),
                       style:viewModel!.userData.validateLoginButton()
                       ? TextStyle(fontSize: 23)
                       : TextStyle(fontSize: 15),
                     child: Text(
                     "Login",
                   ),
                 ),
            ),
           ),
          );
        });
  }

  Widget checkboxSection() {
    return Container(
      child: CheckboxListTile(
        title: Text("Remember Me",style: TextStyle(color: Colors.white),),
        value: isRemember,
        onChanged: (newvalue) {
          setState(() {
            isRemember = newvalue!;
          });
        },
        checkColor: Colors.black,
        contentPadding: EdgeInsets.zero,
        controlAffinity: ListTileControlAffinity.leading,
      ),
    );
  }

  onTabchange(String selectedTab) {
    setState(() {
      chosenTab = selectedTab;
    });
  }

  Widget othersignInoption() {
    return Container(
      height: 150,
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 20,
            child: orSection(),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Sign in using",
            style: TextStyle(fontSize: 20,color: Colors.white),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey,blurRadius: 0.3,spreadRadius: 2)
                  ],
                  color: Colors.white,shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/png/google.png"),
                ),
              ),
                SizedBox(
                  width: 30,
                ),
                Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey,blurRadius: 0.3,spreadRadius: 2)
                  ],
                  color: Colors.white,shape: BoxShape.circle
                ),
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/images/png/facebook.png"),
                ),
                ),
                SizedBox(
                  width: 30,
                ),
                Container(
                 decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(color: Colors.grey,blurRadius: 0.3,spreadRadius: 2)
                  ],
                  color: Colors.white,shape: BoxShape.circle
                 ),
                 child:CircleAvatar(
                  backgroundImage: AssetImage("assets/images/png/twitter.png"),
                 )
                ),
            ],
          ),
              ],
            ),
          );
  }

  Widget orSection() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "Or",
              style: TextStyle(fontSize: 20,color: Colors.white),
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                
                border: Border(
                  bottom: BorderSide(
                    color: Colors.white,
                    width: 3.0,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


Widget signupSection() {
  return Container(
    child: Column(
      children: <Widget>[
        SizedBox(
          height: 30,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Full Name",
            hintText: "Enter Youre Full Name",
            hintStyle: TextStyle(color: Colors.white),
            labelStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
              borderSide: BorderSide(color: Colors.white,),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(28)),
              borderSide: BorderSide(color: Colors.white,width: 3.0),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "E-mail address",
            hintText: "Enter E-mail address",
            labelStyle: TextStyle(color: Colors.white),
            hintStyle: TextStyle(color: Colors.white),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,width: 3.0),
              borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 30,
        ),
        TextField(
          style: TextStyle(color: Colors.white),
          decoration: InputDecoration(
            border: InputBorder.none,
            labelText: "Create Password",
            hintText: "Ente Youre Password",
            labelStyle: TextStyle(color: Colors.white),
            hintStyle:TextStyle(color: Colors.white),
             suffixIcon: IconButton(
                onPressed: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                icon: Icon(obscureText ? Icons.visibility_off_outlined: Icons.visibility_outlined),
                color: Colors.white,
               ),
            enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(
                Radius.circular(28),
              ),
              borderSide: BorderSide(color: Colors.white),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white,width:3.0),
              borderRadius: BorderRadius.all(Radius.circular(28)),
            ),
          ),
          obscureText: true,
        ),
        SizedBox(
          height: 20,
        ),
        createAccount(),
      ],
    ),
  );
}

Widget createAccount() {
  return Container(
    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(28),
        ),
        color: Colors.orange),
    child: Text(
      "Create Account",
      style: TextStyle(color: Colors.white,
        fontSize: 20,
      
      ),
    ),
  );
  
}
}