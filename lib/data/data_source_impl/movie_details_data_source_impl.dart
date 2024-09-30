import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../api_model/api_manager.dart';
import '../api_model/movie_details/MovieDetailsResponse.dart';
import '../data_source/movie_details_online_data_source.dart';



@Injectable(as: MovieDetailsOnlineDataSource)
class MovieDetailsOnlineDataSourceImpl implements MovieDetailsOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  MovieDetailsOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id) {
  return apiManager.loadMovieDetails(id);
  //dependency
  }

}