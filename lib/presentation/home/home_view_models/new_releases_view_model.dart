
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../data/api_model/Results.dart';
import '../../../domain/Result.dart';
import '../../../domain/repository/new_releases_repository.dart';


@injectable

class NewReleasesViewModel extends Cubit<NewReleasesHomeState> {
  NewReleasesRepository newReleasesRepository;

  NewReleasesViewModel(this.newReleasesRepository) : super(NewReleasesLoadingState());



  void loadNewReleasesHomeScreen()async {
    emit(NewReleasesLoadingState());
    var result=await newReleasesRepository.getNewReleases();
    switch(result){
      case Success():{
        emit(NewReleasesSuccessState(result.data));
      }
      case ServerError<List<Results>?>():{
        emit(NewReleasesErrorState(result.exception));
      }

      case Error<List<Results>?>():{
        emit(NewReleasesErrorState(result.exception));
      }

    }

  }
}

sealed class NewReleasesHomeState {}

class NewReleasesLoadingState extends NewReleasesHomeState {}

class NewReleasesSuccessState extends NewReleasesHomeState {
  List<Results>? movieResults;
  NewReleasesSuccessState(this.movieResults);

}

class NewReleasesErrorState extends NewReleasesHomeState {
  Exception exception;
  NewReleasesErrorState(this.exception);
}
