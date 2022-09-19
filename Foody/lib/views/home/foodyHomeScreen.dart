import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/extensionClass/gridViewBuild.dart';
import 'package:foody/models/categoriesHomeModel.dart';
import 'package:foody/networking/networkService.dart';
import 'package:foody/views/dishDetails/dishDetails.dart';
import 'package:foody/views/listOfDishes/listOFDishes.dart';
// import 'package:foody/views/dishDetails/dishDetails.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  static const String id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Category> dishCategories = [];
  List<Popular> popularDish = [];
  List<Special> specialDish = [];

  @override
  void initState() {
    _getCategoriesData();
    super.initState();
  }

  _getCategoriesData() async{
    final data = await CallApi().getDishCategories('dish-categories');
    setState(() {
      dishCategories = data!;
      if (kDebugMode) {
        print(dishCategories);
      }
    });
  }

  // _getCategoriesData() {
  //   CallApi callApi = CallApi();
  //   callApi.getDishCategories('dish-categories').then((response) {
  //     Iterable foodResponse = json.decode(response.body);
  //     dishCategories = foodResponse
  //         .map((categoryMap) => Category.fromJson(categoryMap))
  //         .toList();
  //     popularDish = foodResponse
  //         .map((categoryMap) => Popular.fromJson(categoryMap))
  //         .toList();
  //     specialDish = foodResponse
  //         .map((categoryMap) => Special.fromJson(categoryMap))
  //         .toList();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
      appBar: AppBar(
        // centerTitle: true,
        title: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Text("Foody"),
            // SizedBox(width: 50),
            // Spacer(),
            // const IconButton (
            //   padding:  EdgeInsets.only(right: 10),
            //   constraints: BoxConstraints(),

            // onPressed: () => Container(),),
          ],
        ),
        elevation: 0.0,
      ),
      body: Container(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            kSizedBox10,
            const Text(
              'Food Category',
              style: kTextStyle17,
              // textAlign: TextAlign.left,
            ),
            kSizedBox10,
            Expanded(
              child: GridViewBuilder(
                onPress: () {
                  // Navigator.pushNamed(context, '/listOfDishes');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          ListOfDishes(dishCategories: dishCategories),
                    ),
                  );
                },
                itemCount: dishCategories.length,
                maxCrossAxisExtent: 100,
                childAspectRatio: 1 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                rowColum: dishCategories.length == 0
                    ? const CircularProgressIndicator()
                    : Row(
                            children: [
                              Image.network(dishCategories[index].image.toString(),),
                              const SizedBox(width: 10),
                              Text(
                                dishCategories[index].title.toString(),
                                style: kTextStyle15,
                              ),
                            ],
                      ),
              ),
            ),
            kSizedBox10,
            const Text(
              'Popular Dishes',
              style: kTextStyle17,
            ),
            kSizedBox10,
            Expanded(
              child: GridViewBuilder(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DishDetails(
                          image: popularData.image,
                          calories: popularData.calories,
                          dishDescription: popularData.description,
                          dishesName: popularData.name),
                    ),
                  );
                },
                itemCount: popularDish.length,
                maxCrossAxisExtent: 500,
                childAspectRatio: 5 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                rowColum: popularDish.length == 0
                    ? const CircularProgressIndicator()
                    : Column(
                        children: popularDish.map((popularData) {
                          return Column(
                            children: [
                              Text(
                                popularData.name,
                                style: kTextStyle15,
                              ),
                              Image.network(
                                  "http://yummie.glitch.me/${popularData.image}"),
                              const Spacer(),
                              Text(
                                (popularData.calories).toString(),
                                style: kTextStyle15,
                              ),
                              const SizedBox(height: 5),
                              Text(
                                popularData.description,
                                style: kTextStyle15,
                              ),
                            ],
                          );
                        }).toList(),
                      ),
              ),
            ),
            kSizedBox10,
            const Text(
              "Chef's Specials",
              style: kTextStyle17,
            ),
            kSizedBox10,
            Expanded(
              child: GridViewBuilder(
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) => DishDetails(
                          image: specialData.image,
                          calories: specialData.calories,
                          dishDescription: specialData.description,
                          dishesName: specialData.name),
                    ),
                  );
                },
                itemCount: specialDish.length,
                maxCrossAxisExtent: 500,
                childAspectRatio: 5 / 3,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                rowColum: specialDish.length == 0
                    ? const CircularProgressIndicator()
                    : Row(
                        children: specialDish.map((specialData) {
                          return Row(
                            children: [
                              Image.network(
                                  "http://yummie.glitch.me/${specialData.image}"),
                              kSizedBox10,
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    specialData.description,
                                    style: kTextStyle15,
                                  ),
                                  kSizedBox10,
                                  Text(
                                    specialData.name,
                                    style: kTextStyle15,
                                  ),
                                  const SizedBox(height: 5),
                                  Text(
                                    specialData.calories.toString(),
                                    style: kTextStyle15,
                                  ),
                                ],
                              ),
                            ],
                          );
                        }).toList(),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
