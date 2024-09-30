import 'package:injectable/injectable.dart';

import '../../domain/Result.dart';
import '../../domain/repository/movie_details_repository.dart';
import '../api_model/movie_details/MovieDetailsResponse.dart';
import '../data_source/movie_details_online_data_source.dart';




@Injectable(as: MovieDetailsRepository)
class MovieDetailsRepositoryImpl implements MovieDetailsRepository{
  MovieDetailsOnlineDataSource dataSource;
 @factoryMethod
 MovieDetailsRepositoryImpl(this.dataSource);

  @override
  Future<Result<MovieDetailsResponse>> getMovieDetails(String id){

      return dataSource.getMovieDetails(id);
  }

}