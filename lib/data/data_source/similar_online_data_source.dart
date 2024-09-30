

import '../../domain/Result.dart';
import '../api_model/Results.dart';

abstract class SimilarOnlineDataSource{
  Future<Result<List<Results>?>> getSimilar(String id);
}