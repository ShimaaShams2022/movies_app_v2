
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';


import '../../../domain/Result.dart';
import '../../data/api_model/movie_details/MovieDetailsResponse.dart';
import '../../domain/repository/movie_details_repository.dart';


@injectable

class MovieDetailsViewModel extends Cubit<MovieDetailsHomeState>{
  MovieDetailsRepository movieDetailsRepository;

  MovieDetailsViewModel(this.movieDetailsRepository) : super(MovieDetailsLoadingState());


  void loadMovieDetailsHomeScreen(String id)async {

    emit(MovieDetailsLoadingState());

    var result=await movieDetailsRepository.getMovieDetails(id);

    switch(result){
      case Success():{
        emit(MovieDetailsSuccessState(result.data));
      }
      case ServerError<MovieDetailsResponse>():{
        emit(MovieDetailsErrorState(result.exception));
      }

      case Error<MovieDetailsResponse>():{
        emit(MovieDetailsErrorState(result.exception));
      }

    }

  }
}

sealed class MovieDetailsHomeState {}

class MovieDetailsLoadingState extends MovieDetailsHomeState {}

class MovieDetailsSuccessState extends MovieDetailsHomeState {
  MovieDetailsResponse movieResults;
  MovieDetailsSuccessState(this.movieResults);

}

class MovieDetailsErrorState extends MovieDetailsHomeState {
  Exception exception;
  MovieDetailsErrorState(this.exception);
}
