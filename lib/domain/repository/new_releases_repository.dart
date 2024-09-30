import '../../data/api_model/Results.dart';
import '../Result.dart';

abstract class NewReleasesRepository{
  Future<Result<List<Results>?>> getNewReleases();
}