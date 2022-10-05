
import 'package:flutter/material.dart';
import 'package:foody/presentation/dishDetails/dishDetails.dart';
import 'package:foody/presentation/home/foodyHomeScreen.dart';
import 'package:foody/presentation/listOfDishes/listOFDishes.dart';
import 'package:foody/presentation/onboardingScreen/onboardingScreen.dart';

class Routes {
  static const String onBoardingScreen = '/';
  static const String homeScreen = '/homeScreen';
  static const String listOfDishes = '/listOfDishes';
  static const String dishDetails = '/dishDetails';

}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.onBoardingScreen:
        return MaterialPageRoute(builder: (_) => const OnBoardingScreen());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      // case Routes.listOfDishes:
      //   return MaterialPageRoute(builder: (_) => const ListOfDishes());
      // case Routes.dishDetails:
      //   return MaterialPageRoute(builder: (_) => const DishDetails());

      default:
        return UnDefinedRoute();
    }
  }

  static Route<dynamic> UnDefinedRoute() {
    return MaterialPageRoute(
        builder: (_) => Scaffold(
          appBar: AppBar(
              title: const Text(
                "Page Not Found",
              )),
          body: const Center(
              child: Text(
                "Page Not Found",
              )),
        ));
  }
}

// Navigator.pushNamed(context, Routes.homeScreen);