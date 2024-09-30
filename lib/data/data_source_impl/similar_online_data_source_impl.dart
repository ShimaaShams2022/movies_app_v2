import 'package:injectable/injectable.dart';

import '../../domain/Result.dart';
import '../api_model/Results.dart';
import '../api_model/api_manager.dart';
import '../data_source/similar_online_data_source.dart';




@Injectable(as: SimilarOnlineDataSource)
class SimilarOnlineDataSourceImpl implements SimilarOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  SimilarOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getSimilar(String id) {
  return apiManager.loadSimilarMovies(id);
  //dependency
  }

}