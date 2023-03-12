

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/category_bloc/category_event.dart';
import 'package:foody/bloc/category_bloc/category_state.dart';
import 'package:foody/networking/networkService.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final DishApi _dishApi;
  CategoryBloc(this._dishApi) : super(CategoryLoadingState()){
    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final category = await _dishApi.fetchDishCategories();
        emit(CategoryLoadedState(category));
      } catch (err) {
        emit(ErrorCategory(err.toString()));
      }

    });
  }
}

