

import '../../domain/Result.dart';
import '../api_model/Results.dart';

abstract class PopularOnlineDataSource{
  Future<Result<List<Results>?>> getPopular();
}