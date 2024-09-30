import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../../domain/repository/new_releases_repository.dart';
import '../api_model/Results.dart';
import '../data_source/new_releases_online_data_source.dart';

@Injectable(as: NewReleasesRepository)
class NewReleasesRepositoryImpl implements NewReleasesRepository{
 NewReleasesOnlineDataSource dataSource;

  @factoryMethod
  NewReleasesRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Results>?>> getNewReleases(){
    return dataSource.getNewReleases();
  }

}