

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';



import 'is_success_call.dart';
import '../../domain/Result.dart';
import 'ErrorResponse.dart';
import 'Genres.dart';
import 'Results.dart';
import 'movie_details/MovieDetailsResponse.dart';
import 'movies_list_categories/MoviesListCategoriesResponse.dart';
import 'new_releases/NewReleasesResponse.dart';
import 'popular_movies/popular_response.dart';
import 'recommended/RecommendedResponse.dart';
import 'similar_movies/SimilarMoviesResponse.dart';


@singleton
class ApiManager{

  final dio=Dio();
  String? movieId;

  static  String baseUrl="https://api.themoviedb.org";
  static  String middleUrl="$baseUrl/3/movie";
  static  String PopularMoviesEndpoint ="$middleUrl/popular";
  static  String NewReleasesMoviesEndpoint ="$middleUrl/upcoming";
  static  String RecommendedMoviesEndpoint ="$middleUrl/top_rated";


  static  String GenresMoviesEndpoint ="$baseUrl/3/genre/movie/list";

  Future<Result<List<Results>?>> loadPopularMovies()async{
    try{

    dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
    var response = await dio.get( PopularMoviesEndpoint);
    var popularResponse=PopularResponse.fromJson(response.data);
    if(response.statusCode?.isSuccessCall()==true){
        return Success(data: popularResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }


  Future<Result<List<Genres>?>> loadGenresMovies()async{
    try{

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get( GenresMoviesEndpoint);
      var genresResponse=MoviesListCategoriesResponse.fromJson(response.data);
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: genresResponse.genres);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadNewReleasesMovies()async{
    try{

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get( NewReleasesMoviesEndpoint);
      var newReleasesResponse=NewReleasesResponse.fromJson(response.data);
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: newReleasesResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadRecommendedMovies()async{
    try{

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get( RecommendedMoviesEndpoint);
      var recommendedResponse=RecommendedResponse.fromJson(response.data);
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: recommendedResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }
  Future<Result<MovieDetailsResponse>> loadMovieDetails(String movieId)async{
    try{
      String movieDetailsEndpoint = "$middleUrl/$movieId" ;

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get(movieDetailsEndpoint);
      var movieDetailsResponse=MovieDetailsResponse.fromJson(response.data);

      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: movieDetailsResponse);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadSimilarMovies(String movieId)async{
    try{
      String movieDetailsEndpoint = "$middleUrl/$movieId" ;
      String similarMoviesEndpoint ="$movieDetailsEndpoint/similar";

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get(similarMoviesEndpoint);
      var similarResponse=SimilarMoviesResponse.fromJson(response.data);

      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: similarResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadSearchMovies(String query)async{
    try{


      String searchMoviesEndpoint = "$baseUrl/3/search/movie?query=$query" ;

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get(searchMoviesEndpoint);
      var searchResponse=SimilarMoviesResponse.fromJson(response.data);

      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: searchResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<Genres>> loadGenresOfMovies()async{
    try{

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get( GenresMoviesEndpoint);
      var genresResponse=Genres.fromJson(response.data);
      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: genresResponse);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }

  Future<Result<List<Results>?>> loadCategoryMovies(String genresId)async{
    try{

      String categoryMoviesEndpoint = "$baseUrl/3/discover/movie?with_genres=$genresId" ;

      dio.options.headers['Authorization']='Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkNDk4MzhiNzJjMmZjMDY5ODFlNDExOGI5Njg0MGY3YyIsIm5iZiI6MTcyNzIwNDc2My43NzgyMiwic3ViIjoiNjMyYzlkNDNjNTI1YzQwMDkxYzZkYTgzIiwic2NvcGVzIjpbImFwaV9yZWFkIl0sInZlcnNpb24iOjF9.aczZfEluA9b9ccjUvg1nGZnH4mtksXCK9Q54ojugtVM';
      var response = await dio.get(categoryMoviesEndpoint);
      var categoryResponse=PopularResponse.fromJson(response.data);

      if(response.statusCode?.isSuccessCall()==true){
        return Success(data: categoryResponse.results);
      }
      var errorResponse=ErrorResponse.fromJson(response.data);
      return ServerError(ServerErrorException(errorResponse.statusMessage));

    }on Exception catch(ex){
      return Error(ex);
    }

  }
}