import 'package:flutter_application_1/action/login/loginAction.dart';
import 'package:flutter_application_1/state/login/loginstate.dart';

LoginState loginReducer(LoginState state,dynamic action){
  if(action is UserLoginAction){
    return state.copyWith(userDetail: action.userLogin);
  }
  return state;
}