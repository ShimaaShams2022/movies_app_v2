

import '../../data/api_model/Results.dart';
import '../Result.dart';

abstract class RecommendedRepository{
Future<Result<List<Results>?>> getRecommended();
}