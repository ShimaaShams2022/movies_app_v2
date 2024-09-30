
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../domain/Result.dart';

import '../../data/api_model/Genres.dart';
import '../../domain/repository/genres_repository.dart';

@injectable

class GenresViewModel extends Cubit<GenresHomeState> {
  GenresRepository genresRepository;

  GenresViewModel(this.genresRepository) : super(GenresLoadingState());



  void loadGenresHomeScreen()async {
    emit(GenresLoadingState());
    var result=await genresRepository.getGenres();
    switch(result){
      case Success():{
        emit(GenresSuccessState(result.data));
      }
      case ServerError<List<Genres>?>():{
        emit(GenresErrorState(result.exception));
      }

      case Error<List<Genres>?>():{
        emit(GenresErrorState(result.exception));
      }

    }

  }
}

sealed class GenresHomeState {}

class GenresLoadingState extends GenresHomeState {}

class GenresSuccessState extends GenresHomeState {
  List<Genres>? genresResults;
  GenresSuccessState(this.genresResults);

}

class GenresErrorState extends GenresHomeState {
  Exception exception;
  GenresErrorState(this.exception);
}
