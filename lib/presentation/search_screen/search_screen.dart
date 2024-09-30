import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../basic_files/ErrorStateWidget.dart';
import '../basic_files/loading_widget.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import 'no_movies_found.dart';
import 'search_cubit.dart';
import 'search_result_list_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = "SearchScreen";

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

//field injection
var searchViewModel = getIt.get<SearchCubit>();

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (BuildContext context) =>searchViewModel,
      child: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.1),
          Padding(
            padding:
                const EdgeInsets.only(top: 0, bottom: 5, left: 40, right: 40),
            child: TextField(
              onChanged: (query) {

                searchViewModel.searchMovies(query);
              },

              style: MyThemeData.darkTheme.textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: MyThemeData.darkTheme.textTheme.bodyLarge
                    ?.copyWith(color: MyThemeData.boxMovieTextColor),
                prefixIcon: const Icon(
                  Icons.search,
                  color: MyThemeData.iconColorBasic,
                ),
                filled: true,
                fillColor: MyThemeData.boxMovieBorderColor,
                enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: MyThemeData.boxMovieTextColor),
                    borderRadius: BorderRadius.circular(40)),
                focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: MyThemeData.boxMovieTextColor),
                    borderRadius: BorderRadius.circular(40)),
              ),
            ),
          ),
          BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
            switch (state) {
              case SearchInitialState():
                {
                  return const NoMoviesFound();
                }
              case SearchLoadingState():
                {
                  return LoadingStateWidget();
                }
              case SearchSuccessState():
                {

                  var searchMoviesList =
                      (state).movieResults;
                  return SearchResultListWidget(
                      resultList: searchMoviesList ?? []);
                }
              case SearchErrorState():
                return ErrorStateWidget((state).exception);

              case SearchEmptyState():
                {
                  return const NoMoviesFound();
                }
              default:
                return const NoMoviesFound();
            }
          }),
        ],
      ),
    );
  }
}
