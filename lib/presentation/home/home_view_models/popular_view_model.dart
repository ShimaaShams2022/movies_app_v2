
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api_model/Results.dart';
import '../../../domain/Result.dart';
import '../../../domain/repository/popular_repository.dart';

@injectable

class PopularViewModel extends Cubit<PopularHomeState> {
  PopularRepository popularRepository;

  PopularViewModel(this.popularRepository) : super(PopularLoadingState());



  void loadPopularHomeScreen()async {
    emit(PopularLoadingState());
    var result=await popularRepository.getPopular();
    switch(result){
      case Success():{
        emit(PopularSuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(PopularErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(PopularErrorState(result.exception));
      }

    }

  }
}

sealed class PopularHomeState {}

class PopularLoadingState extends PopularHomeState {}

class PopularSuccessState extends PopularHomeState {
  List<Results>? movieResults;
  PopularSuccessState(this.movieResults);

}

class PopularErrorState extends PopularHomeState {
  Exception exception;
  PopularErrorState(this.exception);
}
