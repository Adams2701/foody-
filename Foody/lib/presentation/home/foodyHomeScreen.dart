import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/category_bloc/category_bloc.dart';
import 'package:foody/bloc/category_bloc/category_state.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/widget_class/gridViewBuild.dart';

import '../route_manger/route_manager.dart';

class HomeScreen extends StatelessWidget {
  // List<Categories> dishCategories = [];
  // List<Populars> popularDish = [];
  // List<Specials> specialDish = [];
  // bool isLoading = false;

  const HomeScreen({super.key});

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
      body: BlocBuilder<CategoryBloc, CategoryState>(
          builder: (context, state) {
        if (state is CategoryLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CategoryLoadedState) {
          List<Categories> categoriesDish = state.category;
          return Container(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KSizedBox10,
                const Text(
                  'Food Category',
                  style: KTextStyle17,
                  // textAlign: TextAlign.left,
                ),
                KSizedBox10,
                Expanded(
                  child: GridViewBuilder(
                    onPress: () {
                      Navigator.pushNamed(context, AppRoutes.listOfDishes);
                    },
                    itemCount: categoriesDish.length,
                    maxCrossAxisExtent: 100,
                    childAspectRatio: 1 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    rowColum: categoriesDish.isEmpty
                        ? const CircularProgressIndicator()
                        : Row(
                            children: [
                              Image.network(
                                categoriesDish[index].image.toString(),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                categoriesDish[index].title.toString(),
                                style: KTextStyle15,
                              ),
                            ],
                          ),
                  ),
                ),
              ],
            ),
          );
        }
        if(state is ErrorCategory){
          return const Center(child:Text("Error"));
        }
        return Container();
      }),
    );
  }

  //
  // KSizedBox10,
  // const Text(
  //   'Popular Dishes',
  //   style: KTextStyle17,
  // ),
  // KSizedBox10,
  // Expanded(
  //   child: GridViewBuilder(
  //     onPress: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (BuildContext context) => DishDetails(
  //               image:
  //               calories: popularDish.calories,
  //               dishDescription: popularDish.description,
  //               dishesName: popularDish.name),
  //         ),
  //       );
  //     },
  //     itemCount: popularDish.length,
  //     maxCrossAxisExtent: 500,
  //     childAspectRatio: 5 / 3,
  //     crossAxisSpacing: 10,
  //     mainAxisSpacing: 10,
  //     rowColum: popularDish.length == 0
  //         ? const CircularProgressIndicator()
  //         : Column(
  //             children: popularDish.map((popularData) {
  //               return Column(
  //                 children: [
  //                   Text(
  //                     popularData.name,
  //                     style: KTextStyle15,
  //                   ),
  //                   Image.network(
  //                       "http://yummie.glitch.me/${popularData.image}"),
  //                   const Spacer(),
  //                   Text(
  //                     (popularData.calories).toString(),
  //                     style: KTextStyle15,
  //                   ),
  //                   const SizedBox(height: 5),
  //                   Text(
  //                     popularData.description,
  //                     style: KTextStyle15,
  //                   ),
  //                 ],
  //               );
  //             }).toList(),
  //           ),
  //   ),
  // ),
  // KSizedBox10,
  // const Text(
  //   "Chef's Specials",
  //   style: KTextStyle17,
  // ),
  // KSizedBox10,
  // Expanded(
  //   child: GridViewBuilder(
  //     onPress: () {
  //       Navigator.push(
  //         context,
  //         MaterialPageRoute(
  //           builder: (BuildContext context) => DishDetails(
  //               image: specialData.image,
  //               calories: specialData.calories,
  //               dishDescription: specialData.description,
  //               dishesName: specialData.name),
  //         ),
  //       );
  //     },
  //     itemCount: specialDish.length,
  //     maxCrossAxisExtent: 500,
  //     childAspectRatio: 5 / 3,
  //     crossAxisSpacing: 10,
  //     mainAxisSpacing: 10,
  //     rowColum: specialDish.length == 0
  //         ? const CircularProgressIndicator()
  //         : Row(
  //             children: specialDish.map((specialData) {
  //               return Row(
  //                 children: [
  //                   Image.network(
  //                       "http://yummie.glitch.me/${specialData.image}"),
  //                   KSizedBox10,
  //                   Column(
  //                     mainAxisAlignment:
  //                         MainAxisAlignment.center,
  //                     children: [
  //                       Text(
  //                         specialData.description,
  //                         style: KTextStyle15,
  //                       ),
  //                       KSizedBox10,
  //                       Text(
  //                         specialData.name,
  //                         style: KTextStyle15,
  //                       ),
  //                       const SizedBox(height: 5),
  //                       Text(
  //                         specialData.calories.toString(),
  //                         style: KTextStyle15,
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               );
  //             }).toList(),
  //           ),
  //   ),
  // ),

}
