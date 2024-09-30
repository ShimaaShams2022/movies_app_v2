

import 'package:injectable/injectable.dart';

import '../../domain/Result.dart';
import '../../domain/repository/Recommended_repository.dart';
import '../api_model/Results.dart';
import '../data_source/recommended_online_data_source.dart';

@Injectable(as: RecommendedRepository)
class RecommendedRepositoryImpl implements RecommendedRepository{
  RecommendedOnlineDataSource dataSource;
 @factoryMethod
 RecommendedRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getRecommended(){
      return dataSource.getRecommended();
  }

}