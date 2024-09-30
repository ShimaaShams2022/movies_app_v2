import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../api_model/Genres.dart';
import '../api_model/api_manager.dart';
import '../data_source/Genres_online_data_source.dart';



@Injectable(as: GenresOnlineDataSource)
class GenresOnlineDataSourceImpl implements GenresOnlineDataSource{

  ApiManager apiManager;
  //constructor injection
  @factoryMethod
  GenresOnlineDataSourceImpl(this.apiManager);

  @override
  Future<Result<List<Genres>?>> getGenres() {
  return apiManager.loadGenresMovies();
  //dependency
  }

}
