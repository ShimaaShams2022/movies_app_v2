

import '../../domain/Result.dart';
import '../api_model/Results.dart';

abstract class SearchOnlineDataSource{
  Future<Result<List<Results>?>> getSearch(String query);
}