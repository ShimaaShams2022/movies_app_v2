import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../di.dart';
import '../basic_files/loading_widget.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import '../search_screen/search_result_list_widget.dart';
import 'category_view_model.dart';
import 'category_widget.dart';

class CategoryDetailsScreen extends StatefulWidget {
  const CategoryDetailsScreen({super.key});

  static const String routeName = "CategoryDetailsScreen";

  @override
  State<CategoryDetailsScreen> createState() => _CategoryDetailsScreenState();
}

class _CategoryDetailsScreenState extends State<CategoryDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

//field injection
  var categoryViewModel = getIt.get<CategoryViewModel>();

  @override
  Widget build(BuildContext context) {
    final GenresNameWithId genresIdName = ModalRoute.of(context)?.settings.arguments as GenresNameWithId;
    categoryViewModel.loadCategoryHomeScreen((genresIdName.id).toString());

    return BlocProvider(
        create: (BuildContext context) => categoryViewModel,
        child: Scaffold(
          appBar: AppBar(
              title: Text(
                genresIdName.name,
                style: MyThemeData.darkTheme.textTheme.titleLarge,
              ),
              backgroundColor: MyThemeData.appbarBackground,
              iconTheme: const IconThemeData(color: Colors.white)),
          body: BlocBuilder<CategoryViewModel, CategoryHomeState>(
              builder: (context, state) {
            switch (state) {
              case CategoryLoadingState():
                return LoadingStateWidget();
              case CategorySuccessState():{
                var categoryMoviesList =state.categoryResults;
                return SearchResultListWidget(resultList:categoryMoviesList??[]);
              }

              case CategoryErrorState():
              return ErrorWidget(state.exception);
            }
          }
              //

              ),
        ));
  }
}
