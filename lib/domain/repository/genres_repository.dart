

import '../../data/api_model/Genres.dart';
import '../Result.dart';

abstract class GenresRepository{
Future<Result<List<Genres>?>> getGenres();
}