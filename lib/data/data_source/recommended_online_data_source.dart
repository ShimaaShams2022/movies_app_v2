
import '../../domain/Result.dart';
import '../api_model/Results.dart';

abstract class RecommendedOnlineDataSource{
  Future<Result<List<Results>?>> getRecommended();
}