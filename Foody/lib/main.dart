import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/category_bloc/category_bloc.dart';
import 'package:foody/bloc/category_bloc/category_event.dart';
import 'package:foody/networking/networkService.dart';
import 'package:foody/presentation/route_manger/route_manager.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => CategoryBloc(RepositoryProvider.of<CallApi>(context))..add(LoadCategoryEvent())),
        // BlocProvider(create: (context) => SpecialBloc(RepositoryProvider.of<CallApi>(context))..add(LoadSpecialEvent())),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        onGenerateRoute: RouteGenerator.getRoute,
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: RepositoryProvider(
          create: (context) => CallApi(),
        ),
        initialRoute: AppRoutes.onBoardingScreen,
      ),
    );
  }
}
