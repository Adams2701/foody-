
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/dish_categories_bloc/dish_categories_bloc.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/presentation/listOfDishes/listOFDishes.dart';

class CategoryHome extends StatelessWidget {
  final List<Categories> categories;
  const CategoryHome({Key? key, required this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
          return Container(
  padding: const EdgeInsets.only(left: 10),
  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      const SizedBox(height: 10),
      const Text(
        'Food Category',
        style: KTextStyle17,
      ),
      const SizedBox(height: 10),
      SizedBox(
        height: 150, // fixed height
        child: GridView.builder(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          gridDelegate:
          const SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 100,
            childAspectRatio: 1 / 3,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: categories.length,
          itemBuilder: (BuildContext ctx, index) {
            Categories category = categories[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        ListOfDishes(
                          category: category,
                        ),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white70,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.network(
                      category.image.toString(),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      category.title.toString(),
                      style: KTextStyle13,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    ],
  ),
);

  }
}
