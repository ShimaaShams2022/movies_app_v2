import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/api_model/Results.dart';
import '../../di.dart';
import '../basic_files/ErrorStateWidget.dart';
import '../basic_files/box_movie_type.dart';
import '../basic_files/loading_image.dart';
import '../basic_files/loading_widget.dart';
import '../basic_files/movie_main_text_large.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import '../basic_files/utilities.dart';
import '../home/popular_poster_with_book_mark_widget.dart';
import '../home/poster_with_some_details.dart';
import 'movie_details_view_model.dart';
import 'similar_view_model.dart';

class MovieDetailsWidget extends StatefulWidget {
  const MovieDetailsWidget({super.key});

  static const String routeName = "MovieDetailsWidget";

  @override
  State<MovieDetailsWidget> createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

//field injection
  var similarViewModel = getIt.get<SimilarViewModel>();
  var movieDetailsViewModel = getIt.get<MovieDetailsViewModel>();

  @override
  Widget build(BuildContext context) {
    final Results? filmInformation =
        ModalRoute.of(context)?.settings.arguments as Results?;
    similarViewModel.loadSimilarHomeScreen((filmInformation?.id).toString());
    movieDetailsViewModel
        .loadMovieDetailsHomeScreen((filmInformation?.id).toString());

    return MultiBlocProvider(
      providers: [
        BlocProvider<SimilarViewModel>(
            create: (BuildContext context) => similarViewModel),
        BlocProvider<MovieDetailsViewModel>(
            create: (BuildContext context) => movieDetailsViewModel),
      ],
      child: Scaffold(
        appBar: AppBar(
            title: Text(
              filmInformation?.title ?? "",
              style: MyThemeData.darkTheme.textTheme.titleLarge,
            ),
            backgroundColor: MyThemeData.appbarBackground,
            iconTheme: const IconThemeData(color: Colors.white)),
        body: SingleChildScrollView(
          child: Column(
            children: [
              LoadingImage(imageName: filmInformation?.backdropPath,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height*0.25),
             // Image.network(
            //      'https://image.tmdb.org/t/p/w500${filmInformation!.backdropPath}'),
              MovieMainTextLarge(filmInformation),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PopularPosterWithBookMarkWidget(
                        addWatchList: false,
                        imageName: filmInformation?.posterPath ?? "",
                      ),
                    ),
                  ),
                  Expanded(
                    flex:2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlocBuilder<MovieDetailsViewModel, MovieDetailsHomeState>(
                            builder: (context, state) {
                          switch (state) {
                            case MovieDetailsLoadingState():
                              return LoadingStateWidget();
                            case MovieDetailsSuccessState():
                              var movieDetails = state.movieResults;
                              return SizedBox(
                                width:MediaQuery.of(context).size.width*0.6,
                                height:50,
                                child: GridView.builder(
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3,
                                    crossAxisSpacing: 5,
                                    mainAxisSpacing: 5,
                                    childAspectRatio: 4,
                                  ),
                                  itemCount: movieDetails.genres?.length,
                                  itemBuilder: (context, index) {
                                    return BoxMovieType(
                                        movieDetails.genres?[index].name ?? "");
                                  },
                                ),
                              );
                            case MovieDetailsErrorState():
                              return ErrorStateWidget(state.exception);
                          }
                        }),
                        Container(
                          width:MediaQuery.of(context).size.width*0.6,
                          child: Text(
                            filmInformation?.overview ?? "",
                            softWrap: true,
                            style: MyThemeData.darkTheme.textTheme.bodyLarge,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.star,
                                color: MyThemeData.darkPrimary,
                                size: 25,
                              ),
                              Text(
                                  roundedNumber(filmInformation?.voteAverage ?? 0),
                                  style: MyThemeData
                                      .darkTheme.textTheme.titleMedium),
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
              BlocBuilder<SimilarViewModel, SimilarHomeState>(
                builder: (context, state) {
                  switch (state) {
                    case SimilarLoadingState():
                      return LoadingStateWidget();
                    case SimilarSuccessState():
                      {
                        var similarMoviesList = state.movieResults ?? [];
                        return Container(
                          margin: const EdgeInsets.only(top: 8, bottom: 8),
                          padding: const EdgeInsets.all(10),
                          color: MyThemeData.listBackground,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "More Like This",
                                style:
                                    MyThemeData.darkTheme.textTheme.titleSmall,
                              ),
                              SizedBox(
                                height: 210,
                                child: ListView.builder(
                                  itemCount: similarMoviesList.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return PosterWithSomeDetails(
                                        filmInformation:
                                            similarMoviesList[index]);
                                  },
                                ),
                              )
                            ],
                          ),
                        );
                      }
                    case SimilarErrorState():
                      return ErrorStateWidget(state.exception);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
