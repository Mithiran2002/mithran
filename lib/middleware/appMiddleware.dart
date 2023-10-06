import 'package:flutter_application_1/state/appstate.dart';
import 'package:redux/redux.dart';

import 'package:redux_persist/redux_persist.dart';
List<Middleware<AppState>>appMiddleWare(Persistor<AppState> persistor) {
return[
  persistor.createMiddleware(),
];
}