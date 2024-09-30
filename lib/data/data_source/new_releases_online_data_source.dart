import '../../domain/Result.dart';
import '../api_model/Results.dart';

abstract class NewReleasesOnlineDataSource{
  Future<Result<List<Results>?>> getNewReleases();
}