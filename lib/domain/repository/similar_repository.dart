

import '../../data/api_model/Results.dart';
import '../Result.dart';

abstract class SimilarRepository{
Future<Result<List<Results>?>> getSimilar(String id);
}