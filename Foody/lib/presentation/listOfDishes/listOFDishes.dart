import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/dish_list/dishlist_bloc.dart';
import 'package:foody/bloc/dish_list/dishlist_state_bloc.dart';
import 'package:foody/constants/constants.dart';
import 'package:foody/data_layer/apiModels/dishModel.dart';
import 'package:foody/data_layer/apiModels/dishes_response_model.dart';
import 'package:foody/presentation/dishDetails/dishDetails.dart';
import '../../bloc/dish_list/dishlist-event_bloc.dart';
import '../../networking/networkService.dart';

class ListOfDishes extends StatelessWidget {
  final Categories category;

  const ListOfDishes({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Row(
          children: [
            Text(
              category.title ?? "N/A",
              style: const TextStyle(
                fontSize: 25.0,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
      body: BlocProvider(
        create: (context) =>
            DishListBloc(RepositoryProvider.of<DishApi>(context))
              ..add(LoadDishListEvent(category.id.toString())),
        child: BlocBuilder<DishListBloc, DishListState>(
          builder: (context, state) {
            if (state is DishListLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is DishListLoadedState) {
              final dishes = state.dishList;
              return ListView.builder(
                  itemCount: dishes.length,
                  itemBuilder: (context, index) {
                    final dish = dishes[index];
                    return Container(
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DishDetails(
                                image: dish.image.toString(),
                                dishesName: dish.name.toString(),
                                dishDescription: dish.description.toString(),
                                calories: dish.calories.toString(),
                                dishId: dish.id!,
                              ),
                            ),
                          );
                        },
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              children: [
                                SizedBox(
                                    width: 100,
                                    height: 120,
                                    child: Image.network(dish.image ?? "N/A")),
                                KSizedBoxW10,
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(dish.name ?? "NA"),
                                      KSizedBoxH10,
                                      Text(
                                        dish.description ?? "NA",
                                        maxLines: 3,
                                        overflow: TextOverflow.clip,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  });
            } else if (state is ErrorDishList) {
              return Center(
                child: Text(state.error),
              );
            } else {
              return const Center(child: Text("Unknown state"));
            }
          },
        ),
      ),
    );
  }
}
