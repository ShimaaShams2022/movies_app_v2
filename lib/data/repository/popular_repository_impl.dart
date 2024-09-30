import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../../domain/repository/popular_repository.dart';
import '../api_model/Results.dart';
import '../data_source/popular_online_data_source.dart';

@Injectable(as: PopularRepository)
class PopularRepositoryImpl implements PopularRepository{
  PopularOnlineDataSource dataSource;
 @factoryMethod
  PopularRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getPopular(){
      return dataSource.getPopular();
  }

}