import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/category_bloc/category_bloc.dart';
import 'package:foody/bloc/category_bloc/category_state.dart';
import 'package:foody/bloc/popular_bloc/popular_bloc.dart';
import 'package:foody/bloc/popular_bloc/popular_states.dart';
import 'package:foody/bloc/special_bloc/special_bloc.dart';
import 'package:foody/bloc/special_bloc/special_states.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/presentation/dishDetails/dishDetails.dart';
import 'package:foody/widget_class/gridViewBuild.dart';

import '../route_manger/route_manager.dart';

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
        children: [
          BlocBuilder<CategoryBloc, CategoryState>(
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
                          itemCount: categoriesDish.length,
                          itemBuilder: (BuildContext ctx, index) {
                            Categories category = categoriesDish[index];
                            return Container(
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
                                    style: KTextStyle15,
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is ErrorCategory) {
                return const Center(child: Text("Error"));
              }
              return Container();
            },
          ),
          // BlocBuilder<PopularBloc, PopularState>(
          //   builder: (context, state) {
          //     if (state is PopularLoadingState) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (state is PopularLoadedState) {
          //       List<Populars> popularDish = state.popular;
          //       return Container(
          //         padding: const EdgeInsets.only(left: 10),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             KSizedBox10,
          //             const Text(
          //               'Popular Dishes',
          //               style: KTextStyle17,
          //             ),
          //             KSizedBox10,
          //             Expanded(
          //               child: GridView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 shrinkWrap: true,
          //                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //                     maxCrossAxisExtent: 500,
          //                     childAspectRatio: 5 / 3,
          //                     crossAxisSpacing: 10,
          //                     mainAxisSpacing: 10
          //                 ),
          //                 itemCount: popularDish.length,
          //                 itemBuilder: (BuildContext ctx, index) {
          //                   Populars popular = popularDish[index];
          //                   return Container(
          //                     padding: const EdgeInsets.all(10),
          //                     margin: const EdgeInsets.all(10),
          //                     decoration: BoxDecoration(
          //                       color: Colors.white70,
          //                       borderRadius: BorderRadius.circular(10),
          //                     ),
          //                     child: Column(
          //                       children: [
          //                         Text(
          //                           popular.name,
          //                           style: KTextStyle15,
          //                         ),
          //                         Image.network(
          //                             "http://yummie.glitch.me/${popular.image}"
          //                         ),
          //                         const Spacer(),
          //                         Text(
          //                           (popular.calories).toString(),
          //                           style: KTextStyle15,
          //                         ),
          //                         const SizedBox(height: 5),
          //                         Text(
          //                           popular.description,
          //                           style: KTextStyle15,
          //                         ),
          //                       ],
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //     if (state is ErrorPopular) {
          //       return const Center(child: Text("Error"));
          //     }
          //     // add a default return statement here in case none of the above conditions are met
          //     return const SizedBox.shrink();
          //   },
          // ),
          // BlocBuilder<SpecialBloc, SpecialState>(
          //   builder: (context, state) {
          //     if (state is SpecialLoadingState) {
          //       return const Center(
          //         child: CircularProgressIndicator(),
          //       );
          //     }
          //     if (state is SpecialLoadedState) {
          //       List<Specials> specialDish = state.special;
          //       return Container(
          //         padding: const EdgeInsets.only(left: 10),
          //         child: Column(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             KSizedBox10,
          //             const Text(
          //               'Food Special',
          //               style: KTextStyle17,
          //               // textAlign: TextAlign.left,
          //             ),
          //             KSizedBox10,
          //             Expanded(
          //               child: GridView.builder(
          //                 scrollDirection: Axis.horizontal,
          //                 shrinkWrap: true,
          //                 gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //                     maxCrossAxisExtent: 500,
          //                     childAspectRatio: 5 / 3,
          //                     crossAxisSpacing: 10,
          //                     mainAxisSpacing: 10),
          //                 itemCount: specialDish.length,
          //                 itemBuilder: (BuildContext ctx, index) {
          //                   Specials special = specialDish[index];
          //                   return GestureDetector(
          //                     onTap: () {
          //                       Navigator.push(
          //                         context,
          //                         MaterialPageRoute(
          //                           builder: (BuildContext context) => DishDetails(
          //                               image: specialDish[index].image,
          //                               calories: specialDish[index].calories,
          //                               dishDescription: specialDish[index].description,
          //                               dishesName: special.name),
          //                         ),
          //                       );
          //                     },
          //                     child: Container(
          //                       padding: const EdgeInsets.all(10),
          //                       margin: const EdgeInsets.all(10),
          //                       decoration: BoxDecoration(
          //                         color: Colors.white70,
          //                         borderRadius: BorderRadius.circular(10),
          //                       ),
          //                       child: Row(
          //                         children: [
          //                           Image.network(
          //                               "http://yummie.glitch.me/${specialDish[index].image}"),
          //                           KSizedBox10,
          //                           Column(
          //                             mainAxisAlignment: MainAxisAlignment.center,
          //                             children: [
          //                               Text(
          //                                 special.description,
          //                                 style: KTextStyle15,
          //                               ),
          //                               KSizedBox10,
          //                               Text(
          //                                 special.name,
          //                                 style: KTextStyle15,
          //                               ),
          //                               const SizedBox(height: 5),
          //                               Text(
          //                                 special.calories.toString(),
          //                                 style: KTextStyle15,
          //                               ),
          //                             ],
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                   );
          //                 },
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //     if (state is ErrorSpecial) {
          //       return const Center(child: Text("Error"));
          //     }
          //     // add a default return statement here in case none of the above conditions are met
          //     return const SizedBox.shrink();
          //   },
          // ),
        ],
      ),
    );
  }
}

// onPress: () {
// Navigator.push(
// context,
// MaterialPageRoute(
// builder: (BuildContext context) => DishDetails(
// image:
// calories: popularDish.calories,
// dishDescription: popularDish.description,
// dishesName: popularDish.name),
// ),
// );
// }
