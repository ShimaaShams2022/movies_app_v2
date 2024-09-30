import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../api_model/Results.dart';
import '../api_model/api_manager.dart';
import '../data_source/search_online_data_source.dart';





@Injectable(as: SearchOnlineDataSource)

class SearchOnlineDataSourceImpl implements SearchOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  SearchOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getSearch(String id) {
  return apiManager.loadSearchMovies(id);
  //dependency
  }

}