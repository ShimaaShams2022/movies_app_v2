


import 'package:injectable/injectable.dart';

import '../../domain/Result.dart';
import '../api_model/Results.dart';
import '../api_model/api_manager.dart';
import '../data_source/new_releases_online_data_source.dart';

@Injectable(as: NewReleasesOnlineDataSource)
class NewReleasesOnlineDataSourceImpl implements NewReleasesOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  NewReleasesOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Results>?>> getNewReleases() {
    return apiManager.loadNewReleasesMovies();
    //dependency
  }

}