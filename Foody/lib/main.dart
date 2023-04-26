import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/dish_categories_bloc/dish_categories_bloc.dart';
import 'package:foody/bloc/dish_list/dishlist-event_bloc.dart';
import 'package:foody/bloc/dish_list/dishlist_bloc.dart';
import 'package:foody/bloc/order_bloc/order_bloc.dart';
import 'package:foody/networking/networkService.dart';
import 'package:foody/presentation/route_manger/route_manager.dart';

import 'data_layer/apiModels/dishModel.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DishApi(),
      child: MultiBlocProvider(
        providers: [
          //Foody_Home_Bloc
          BlocProvider<DishBloc>(
            create: (context) => DishBloc(
              RepositoryProvider.of<DishApi>(context),
              //context.read<DishApi>(), it can be used to retrieve in the instance of DishApI and pass it to the DishBloc
            )..add(LoadDishData()),
          ),
          BlocProvider<OrderBloc>(
            create: (context) => OrderBloc(
                RepositoryProvider.of<DishApi>(context)),
          )
          // BlocProvider<DishListBloc>(
          //   create: (context) => DishListBloc(
          //     RepositoryProvider.of<DishApi>(context),
          //   )..add(LoadDishListEvent(categoryId: category)),
          // ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          initialRoute: AppRoutes.homeScreen,
        ),
      ),
    );
  }
}


