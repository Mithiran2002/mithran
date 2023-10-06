import 'dart:async';

import 'package:flutter_application_1/model/Login/LoginModel.dart';
import 'package:flutter_application_1/state/appstate.dart';
import 'package:redux/redux.dart';

class LoginPageViewModel {
  Store<AppState>? store1;
  UserLogin userData = UserLogin();
  StreamController loginButtonBuilder = StreamController();
  // Add your state and logic here
}
