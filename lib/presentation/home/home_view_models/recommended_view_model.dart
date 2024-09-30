
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api_model/Results.dart';
import '../../../domain/Result.dart';
import '../../../domain/repository/Recommended_repository.dart';

@injectable

class RecommendedViewModel extends Cubit<RecommendedHomeState> {
  RecommendedRepository recommendedRepository;

  RecommendedViewModel(this.recommendedRepository) : super(RecommendedLoadingState());



  void loadRecommendedHomeScreen()async {
    emit(RecommendedLoadingState());
    var result=await recommendedRepository.getRecommended();
    switch(result){
      case Success():{
        emit(RecommendedSuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(RecommendedErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(RecommendedErrorState(result.exception));
      }

    }

  }
}

sealed class RecommendedHomeState {}

class RecommendedLoadingState extends RecommendedHomeState {}

class RecommendedSuccessState extends RecommendedHomeState {
  List<Results>? movieResults;
  RecommendedSuccessState(this.movieResults);

}

class RecommendedErrorState extends RecommendedHomeState {
  Exception exception;
  RecommendedErrorState(this.exception);
}
