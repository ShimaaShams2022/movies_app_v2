
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../domain/Result.dart';
import '../../data/api_model/Results.dart';
import '../../domain/repository/category_repository.dart';


@injectable

class CategoryViewModel extends Cubit<CategoryHomeState> {
  CategoryRepository categoryRepository;

  CategoryViewModel(this.categoryRepository) : super(CategoryLoadingState());



  void loadCategoryHomeScreen(String genresId)async {
    emit(CategoryLoadingState());

    var result=await categoryRepository.getCategory(genresId);

    switch(result){
      case Success():{
        emit(CategorySuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(CategoryErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(CategoryErrorState(result.exception));
      }

    }

  }
}

sealed class CategoryHomeState {}

class CategoryLoadingState extends CategoryHomeState {}

class CategorySuccessState extends CategoryHomeState {
  List<Results>? categoryResults;
  CategorySuccessState(this.categoryResults);

}

class CategoryErrorState extends CategoryHomeState {
  Exception exception;
  CategoryErrorState(this.exception);
}
