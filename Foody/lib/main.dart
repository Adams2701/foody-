import 'package:flutter/material.dart';
import 'package:foody/views/dishDetails/dishDetails.dart';
import 'package:foody/views/home/foodyHomeScreen.dart';
import 'package:foody/views/listOfDishes/listOFDishes.dart';
import 'package:foody/views/onboardingScreen/onboardingScreen.dart';



void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
      initialRoute: HomeScreen.id,
      routes: {
          OnBoardingScreen.id : (context) => const OnBoardingScreen(),
        HomeScreen.id :(context) => const HomeScreen(),
        // ListOfDishes.id :(context) => ListOfDishes(dishCategories: categoryData),
        // DishDetails.id :(context) => DishDetails()
        // '/dishDetails' : (context) => const DishDetails(listOfDish: null,),

      },
    );
  }
}
