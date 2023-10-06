import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show AppBar, BoxDecoration, BuildContext, Color, Colors, Column, Container, CrossAxisAlignment, Expanded, GestureDetector, Icon, Icons, MainAxisAlignment, MaterialApp, MediaQuery, Row, Scaffold, SingleTickerProviderStateMixin, State, StatefulWidget, StatelessWidget, TabController, Text, ThemeData, Widget, runApp;
import 'package:flutter_application_1/components/landing%20page/landing_Page.dart';
import 'package:flutter_application_1/middleware/appMiddleware.dart';
import 'package:flutter_application_1/reducer/AppStateReducer.dart';
import 'package:flutter_application_1/state/appstate.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';
import 'components/login page/login_page.dart';
import 'package:redux_persist/redux_persist.dart';
Future<Store<AppState>> createStore(persister,initialState)async {
  return Store(appStateReducer,initialState:(initialState == null || (initialState as AppState).loginState == null)
  ?AppState.initial()
  :initialState,
  middleware:appMiddleWare((persister)),
  );
}
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final persistor = Persistor<AppState>(
        storage:FlutterStorage(location:FlutterSaveLocation.sharedPreferences),
        serializer:JsonSerializer<AppState>(AppState.fromJson),
        debug:true,
        throttleDuration:Duration(seconds: 2),);

        final initialState = await persistor.load();
        Store<AppState> store = await createStore(persistor,initialState);
        
        runApp(MyApp(store:store));
  
  
  
}

class MyApp extends StatefulWidget {
  final Store<AppState>? store;
  const MyApp({super.key,this.store});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => MyAppPage();
}
 class MyAppPage extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: widget.store!,
      child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'My Home Page',
      theme: ThemeData(
      primarySwatch: Colors.orange,
      ),
  
      home:(widget.store!=null &&
             widget.store!.state != null && 
             widget.store!.state.loginState != null &&
             widget.store!.state.loginState!.userDetail != null &&
             widget.store!.state.loginState!.userDetail!.email != null)
             
             ?LandingPage()
             :LoginPage(),
          
           
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int counter = 0;
  String? name;
  String chosenTab = "home";
  

  TabController? tabController;
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: pageContend(),
    ); 
  }

  Widget pageContend() {
    return Column(
      children: [
        Row(
          children: <Widget>[
            GestureDetector(
              onTap: () {
                changeTheTabState(
                  "home"
                );
              },
              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                   color: chosenTab=="home"? Colors.purple : Colors.white,
                  // condtion ? function1: function 2 tertinary operator
                
                ),
                child: Icon(
                  Icons.home,
                  color: Colors.pink,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                changeTheTabState(
                  "search"
                );
              },

              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  // condtion ? function1: function 2 tertinary operator
                  color: chosenTab=="search"? Colors.purple : Colors.white,
                ),
                child: Icon(
                  Icons.search,
                  color: Colors.pink,
                ),
              ),
            ),
          
           GestureDetector(
              onTap: () {
                changeTheTabState(
                  "flight"
                );
              },

              child: Container(
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  // condtion ? function1: function 2 tertinary operator
                  color: chosenTab=="flight"? Colors.purple : Colors.white,
                ),
                child: Icon(
                  Icons.flight,
                  color: Colors.pink,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: chosenTab=="home"? diagram2() :chosenTab=="search"? diagram3():Container(),
        )
      ],
    );
  }

  changeTheTabState(
    String selectedTab
  ) {
    setState(() {
      chosenTab = selectedTab;
    });
  }

  Widget diagram3() {
    return Column(
      // alignment: Alignment.centerRight,
      children: <Widget>[
        coloredContainer(Colors.red),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            coloredContainer(Colors.yellow),
            coloredContainer(Colors.yellow)
          ],
        ),
        coloredContainer(Colors.red)
      ],
    );
  }

  Widget diagram2() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            coloredContainer(Colors.red),
            coloredContainer(Colors.yellow),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            coloredContainer(Colors.red),
            coloredContainer(Colors.yellow)
          ],
        )
      ],
    );
  }

  Widget coloredContainer(Color givenColor) {
    return Container(
      color: givenColor,
      height: 40,
      width: 60,
    );
  }

}