import 'package:bookstudiofyp/pages/home_page.dart';
import 'package:bookstudiofyp/pages/menu_user.dart';
import 'package:flutter/material.dart';
import './services/authentication.dart';

//pages
import './pages/root_page.dart';
import './pages/home_page.dart';
import './pages/menu_user.dart';


void main() => runApp(MyApp());


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        //title: 'Startup Name Generator',
       home: new RootPage(auth: new Auth()),
      routes: <String, WidgetBuilder> {
      '/landingpage': (BuildContext context) => new MyApp(),
      '/homepage': (BuildContext context) => new HomePage(),
      '/menu_user': (BuildContext context) => new MenuPage()
    },
    );

  }

}