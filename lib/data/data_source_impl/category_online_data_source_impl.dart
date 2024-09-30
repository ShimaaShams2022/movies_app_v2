import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../api_model/Results.dart';
import '../api_model/api_manager.dart';
import '../data_source/category_online_data_source.dart';


@Injectable(as: CategoryOnlineDataSource)

class CategoryOnlineDataSourceImpl implements CategoryOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  CategoryOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getCategory(String genresId) {
  return apiManager.loadCategoryMovies(genresId);
  //dependency
  }

}