

import '../../domain/Result.dart';
import '../api_model/Genres.dart';



abstract class GenresOnlineDataSource{
  Future<Result<List<Genres>?>> getGenres();
}