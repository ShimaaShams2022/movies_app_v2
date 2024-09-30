
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../data/api_model/Results.dart';
import '../../domain/Result.dart';
import '../../domain/repository/search_repository.dart';

@injectable

class SearchCubit extends Cubit<SearchState> {


  SearchRepository searchRepository;

  SearchCubit(this.searchRepository) : super(SearchInitialState());

  //final Dio dio;

  //SearchCubit(this.dio) : super(SearchInitialState());

  void searchMovies(String query) async {

    if (query.isEmpty) {
      emit(SearchEmptyState());
      return;
    }

    emit(SearchLoadingState());

    try {
      var response = await searchRepository.getSearch(query);

      if (response
          .toString()
          .isEmpty) {
        emit(SearchEmptyState());
      }
      else {
        switch (response) {
          case Success<List<Results>?>():
            emit(SearchSuccessState(response.data));
          case ServerError<List<Results>?>():
            emit(SearchErrorState(response.exception));
          case Error<List<Results>?>():
            emit(SearchErrorState(response.exception));
        }
      }
    }catch(e){
      emit(SearchErrorState(e.toString() as Exception));
    }
  }
}

sealed class SearchState {}

class SearchLoadingState extends SearchState {


}



class SearchInitialState extends SearchState {

}

class SearchSuccessState extends SearchState {
  List<Results>? movieResults;
  SearchSuccessState(this.movieResults);
}



class SearchErrorState extends SearchState {
 Exception exception;
  SearchErrorState(this.exception);
}

class SearchEmptyState extends SearchState {

}
