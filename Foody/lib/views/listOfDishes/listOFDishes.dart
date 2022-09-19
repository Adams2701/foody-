import 'package:flutter/material.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/models/categoriesHomeModel.dart';
import 'package:foody/models/listOfDishModel.dart';

class ListOfDishes extends StatelessWidget {
  static const String id = 'listOfDishes';

  final List <ListOfDishesModel> listOfDishes = [];
  final  Category dishCategories;

  ListOfDishes({super.key, required this.dishCategories});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: [
              IconButton(
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back_ios,
                      color: Color(0xff363f93)),
                  onPressed: () => Navigator.pop(context)),
              Text(
                dishCategories.name,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          )),
      body: Container(
        margin: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () =>
                    ListView.builder(
                      itemCount: 7,
                      itemBuilder: (context, index) => Row(
                        children: [
                          Image.network(""),
                          Column(
                            children: const [
                              Text(""),
                              kSizedBox10,
                              Text(""),
                            ],
                          ),
                        ],
                        ),

                      ),
                  ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
