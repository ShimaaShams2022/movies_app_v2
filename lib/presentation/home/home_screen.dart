import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';

import '../basic_files/ErrorStateWidget.dart';
import '../basic_files/custom_ads_widget.dart';
import '../basic_files/loading_widget.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import 'home_view_models/new_releases_view_model.dart';
import 'home_view_models/popular_view_model.dart';
import 'home_view_models/recommended_view_model.dart';
import 'network_poster_with_book_mark.dart';
import 'poster_with_some_details.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  static const String routeName = "HomeScreen";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex = 0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startImageSwitching(10);
    popularViewModel.loadPopularHomeScreen();
    newReleasesViewModel.loadNewReleasesHomeScreen();
    recommendedViewModel.loadRecommendedHomeScreen();
  }

  void _startImageSwitching(int lengthOfList) {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % lengthOfList;
      });
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

//field injection
  var popularViewModel = getIt.get<PopularViewModel>();
  var newReleasesViewModel = getIt.get<NewReleasesViewModel>();
  var recommendedViewModel = getIt.get<RecommendedViewModel>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PopularViewModel>(
            create: (BuildContext context) => popularViewModel),
        BlocProvider<NewReleasesViewModel>(
            create: (BuildContext context) => newReleasesViewModel),
        BlocProvider<RecommendedViewModel>(
            create: (BuildContext context) => recommendedViewModel)
      ],
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<PopularViewModel, PopularHomeState>(
              builder: (context, state) {
                switch (state) {
                  case PopularLoadingState():
                    return LoadingStateWidget();
                  case PopularSuccessState():
                    {
                      var ads = state.movieResults ?? [];
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.04),
                          CustomAdsWidget(
                            popularResults: ads,
                            currentIndex: _currentIndex,
                            timer: _timer,
                          ),
                        ],
                      );
                    }
                  case PopularErrorState():
                    return ErrorStateWidget(state.exception);
                }
              },
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.01),
            BlocBuilder<NewReleasesViewModel, NewReleasesHomeState>(
              builder: (context, state) {
                switch (state) {
                  case NewReleasesLoadingState():
                    return LoadingStateWidget();
                  case NewReleasesSuccessState():
                    {
                      var newReleasesMoviesList = state.movieResults ?? [];
                      return Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        padding: EdgeInsets.all(10),
                        color: MyThemeData.listBackground,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "New Releases",
                              style: MyThemeData.darkTheme.textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 150,
                                    child: ListView.builder(
                                      itemCount: newReleasesMoviesList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return Padding(
                                            padding: EdgeInsets.all(5),
                                            child: NetworkPosterWithBookmark(filmInformation: newReleasesMoviesList[index],));
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                  case NewReleasesErrorState():
                    return ErrorStateWidget(state.exception);
                }
              },
            ),
            BlocBuilder<RecommendedViewModel, RecommendedHomeState>(
              builder: (context, state) {
                switch (state) {
                  case RecommendedLoadingState():
                    return LoadingStateWidget();
                  case RecommendedSuccessState():
                    {
                      var recommendedMoviesList = state.movieResults ?? [];
                      return Container(
                        margin: EdgeInsets.only(top: 8, bottom: 8),
                        padding: EdgeInsets.all(10),
                        color: MyThemeData.listBackground,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Recommended",
                              style: MyThemeData.darkTheme.textTheme.titleSmall,
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SizedBox(
                                    height: 200,
                                    child: ListView.builder(
                                      itemCount: recommendedMoviesList.length,
                                      scrollDirection: Axis.horizontal,
                                      itemBuilder: (context, index) {
                                        return PosterWithSomeDetails(
                                          filmInformation:recommendedMoviesList[index]

                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    }
                  case RecommendedErrorState():
                    return ErrorStateWidget(state.exception);
                }
              },
            ),

          ],
        ),
      ),
    );
  }
}
