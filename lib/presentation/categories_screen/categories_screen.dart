import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';

import '../basic_files/loading_widget.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import 'all_categories_widget.dart';
import 'genres_view_model.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  static const String routeName = "CategoriesScreen";

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    genresViewModel.loadGenresHomeScreen();
  }

//field injection
  var genresViewModel = getIt.get<GenresViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => genresViewModel,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 0, left: 25, right: 10),
            child: Text("Browse Category",
                style: MyThemeData.darkTheme.textTheme.headlineMedium),
          ),
          BlocBuilder<GenresViewModel, GenresHomeState>(
              builder: (context, state) {
            switch (state) {
              case GenresLoadingState():
                return LoadingStateWidget();
              case GenresSuccessState():{
                var genresList = state.genresResults;
                return AllCategoriesWidget(genresList);
              }

              case GenresErrorState():
                return ErrorWidget(state.exception);
              //ErrorStateWidget(state);
            }
          }
              //
              ),
        ],
      ),
    );
  }
}
