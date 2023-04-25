import 'package:flutter/material.dart';
import 'package:foody/presentation/home/categoryHome.dart';
import 'package:foody/presentation/home/popular_home.dart';
import 'package:foody/presentation/home/special_home.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        title: Row(
          children: const [
            Text("Foody"),
          ],
        ),
        elevation: 0.0,
      ),
      body: Column(
        children: const [
          CategoryHome(),
          PopularHome(),
          SpecialHome()
        ],
      ),
    );
  }
}