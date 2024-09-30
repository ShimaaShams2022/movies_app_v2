import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../api_model/Results.dart';
import '../api_model/api_manager.dart';
import '../data_source/recommended_online_data_source.dart';



@Injectable(as: RecommendedOnlineDataSource)
class RecommendedOnlineDataSourceImpl implements RecommendedOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  RecommendedOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getRecommended() {
  return apiManager.loadPopularMovies();
  //dependency
  }

}