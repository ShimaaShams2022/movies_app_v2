
import '../../data/api_model/movie_details/MovieDetailsResponse.dart';
import '../Result.dart';

abstract class MovieDetailsRepository{
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id);
}