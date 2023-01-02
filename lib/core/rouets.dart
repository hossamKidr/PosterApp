import 'package:flutter/material.dart';
import '../features/posters/presintation/views/home_view.dart';
import '../features/posters/presintation/views/splash_view.dart';

class Routes{
  static const splash ="/";
  static const home = "/home";
}
class RoutesGenerator{

  static Route<dynamic> getRoute(RouteSettings settings){
    switch(settings.name) {
      case  Routes.splash:
        return MaterialPageRoute(builder: (_)=>const SplashView());
      case Routes.home:
        return MaterialPageRoute(builder: (_)=>const HomeView());
      default:
        return unDefinedRoute();

    }

  }
  static Route<dynamic> unDefinedRoute(){
    return MaterialPageRoute(builder: (_)=> const Scaffold());
}
}