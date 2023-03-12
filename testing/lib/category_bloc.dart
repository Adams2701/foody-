
import 'package:bloc/bloc.dart';
import 'category_event.dart';
import 'category_repository.dart';
import 'category_state.dart';


class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc(this._categoryRepository) : super(CategoryLoading()) {
    on<LoadCategories>((event, emit) async {
      // handle the LoadCategories event here
      emit(CategoryLoading());
      try{
        final categoryData = await CategoryRepository.fetchCategories();
        emit(CategoryLoaded(categories: categoryData));
      } catch (err) {
        emit(CategoryError(err.toString()));
      }
      });
    }
  }

