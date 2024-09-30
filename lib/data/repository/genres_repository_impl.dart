import 'package:injectable/injectable.dart';


import '../../domain/Result.dart';
import '../../domain/repository/genres_repository.dart';
import '../api_model/Genres.dart';
import '../data_source/Genres_online_data_source.dart';


@Injectable(as: GenresRepository)
class GenresRepositoryImpl implements GenresRepository{
  GenresOnlineDataSource dataSource;

 @factoryMethod
 GenresRepositoryImpl(this.dataSource);

  @override
  Future<Result<List<Genres>?>> getGenres(){
      return dataSource.getGenres();
  }

}