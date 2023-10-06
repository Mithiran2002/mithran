import 'package:flutter_application_1/reducer/login/loginReducer.dart';
import 'package:flutter_application_1/state/appstate.dart';

AppState appStateReducer(AppState state,dynamic action){
  return AppState(
    loginState: loginReducer(state.loginState!,action),
  );
}