import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../api_model/Results.dart';
import '../api_model/api_manager.dart';
import '../data_source/popular_online_data_source.dart';


@Injectable(as: PopularOnlineDataSource)
class PopularOnlineDataSourceImpl implements PopularOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  PopularOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getPopular() {
  return apiManager.loadPopularMovies();
  //dependency
  }

}