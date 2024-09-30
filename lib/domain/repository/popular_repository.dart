
import '../../data/api_model/Results.dart';
import '../Result.dart';

abstract class PopularRepository{
Future<Result<List<Results>?>> getPopular();
}