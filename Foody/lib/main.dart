import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/category_bloc/category_bloc.dart';
import 'package:foody/bloc/category_bloc/category_event.dart';
import 'package:foody/bloc/popular_bloc/popular_bloc.dart';
import 'package:foody/bloc/popular_bloc/popular_event.dart';
import 'package:foody/bloc/special_bloc/special_bloc.dart';
import 'package:foody/bloc/special_bloc/special_event.dart';
import 'package:foody/networking/networkService.dart';
import 'package:foody/presentation/route_manger/route_manager.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => DishApi(),
      child: MultiBlocProvider(
        providers: [
          //Foody_Home_Bloc
          BlocProvider(
            create: (context) => CategoryBloc(
                RepositoryProvider.of<DishApi>(context)
            )..add(LoadCategoryEvent()),
          ),
          BlocProvider(
            create: (context) => PopularBloc(
              RepositoryProvider.of<DishApi>(context)
            )..add(LoadPopularEvent()),
          ),
          BlocProvider(
            create: (context) => SpecialBloc(
                RepositoryProvider.of<DishApi>(context)
            )..add(LoadSpecialEvent()),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.getRoute,
          theme: ThemeData(
            primarySwatch: Colors.red,
          ),
          initialRoute: AppRoutes.onBoardingScreen,
        ),
      ),
    );
  }
}
