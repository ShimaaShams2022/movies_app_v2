import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../../domain/repository/search_repository.dart';
import '../api_model/Results.dart';
import '../data_source/search_online_data_source.dart';




@Injectable(as: SearchRepository)
class SearchRepositoryImpl implements SearchRepository{
  SearchOnlineDataSource dataSource;
 @factoryMethod
 SearchRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getSearch(String query){
      return dataSource.getSearch(query);
  }

}