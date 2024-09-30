
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api_model/Results.dart';
import '../../../domain/Result.dart';

import '../../domain/repository/similar_repository.dart';

@injectable

class SimilarViewModel extends Cubit<SimilarHomeState>{
  SimilarRepository similarRepository;

  SimilarViewModel(this.similarRepository) : super(SimilarLoadingState());


  void loadSimilarHomeScreen(String id)async {

    emit(SimilarLoadingState());

    var result=await similarRepository.getSimilar(id);

    switch(result){
      case Success():{
        emit(SimilarSuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(SimilarErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(SimilarErrorState(result.exception));
      }

    }

  }
}

sealed class SimilarHomeState {}

class SimilarLoadingState extends SimilarHomeState {}

class SimilarSuccessState extends SimilarHomeState {
  List<Results>? movieResults;
  SimilarSuccessState(this.movieResults);

}

class SimilarErrorState extends SimilarHomeState {
  Exception exception;
  SimilarErrorState(this.exception);
}
