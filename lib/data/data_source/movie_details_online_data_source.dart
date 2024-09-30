

import '../../domain/Result.dart';

import '../api_model/movie_details/MovieDetailsResponse.dart';

abstract class MovieDetailsOnlineDataSource{
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id);
}