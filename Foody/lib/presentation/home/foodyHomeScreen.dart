import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/dish_categories_bloc/dish_categories_bloc.dart';
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
      body: BlocBuilder<DishBloc, DishState>(
        builder: (context, state) {
          if (state is DishLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is DishLoadedState) {
            return Column(
              children: [
                CategoryHome(categories: state.data.categories ?? []),
                 PopularHome(popularDish: state.data.populars ?? [],),
                 SpecialHome(specialDish: state.data.specials ?? [])
              ],
            );
          }
          if (state is DishErrorState) {
            return const Center(child: Text("Error"));
          }
          return Container();
        },
      ),
    );
  }
}

