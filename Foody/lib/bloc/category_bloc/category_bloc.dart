

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foody/bloc/category_bloc/category_event.dart';
import 'package:foody/bloc/category_bloc/category_state.dart';
import 'package:foody/networking/networkService.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CallApi _callApi;
  CategoryBloc(this._callApi) : super(CategoryLoadingState()){
    on<LoadCategoryEvent>((event, emit) async {
      emit(CategoryLoadingState());
      try {
        final categoryData = await _callApi.getDish('dish-categories');
        emit(CategoryLoadedState(categoryData));
      } catch (err) {
        emit(ErrorCategory(err.toString()));
      }

    });
  }


}
