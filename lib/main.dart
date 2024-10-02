import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'data/firestore_database/movie_provider.dart';
import 'di.dart';

import 'firebase_options.dart';
import 'presentation/basic_files/default_screen.dart';
import 'presentation/basic_files/my_theme/my_theme_data.dart';
import 'presentation/categories_screen/categories_screen.dart';
import 'presentation/categories_screen/category_details_screen.dart';
import 'presentation/home/home_screen.dart';
import 'presentation/movie_details/movie_details_widget.dart';
import 'presentation/search_screen/search_screen.dart';
import 'presentation/watch_list_screen/watch_list_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    name: "movies_app_v2",
    options: DefaultFirebaseOptions.currentPlatform,
  );

  configureDependencies();


  runApp( MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>MovieProvider()),
      ],

      child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute:DefaultScreen.routeName,
        routes: {
          DefaultScreen.routeName: (_) => const DefaultScreen(),
          CategoriesScreen.routeName: (_) => const CategoriesScreen(),
          HomeScreen.routeName: (_) => HomeScreen(),
          SearchScreen.routeName: (_) => const SearchScreen(),
          WatchListScreen.routeName: (_) => const WatchListScreen(),
          MovieDetailsWidget.routeName: (_) => const MovieDetailsWidget(),
          CategoryDetailsScreen.routeName: (_) =>const CategoryDetailsScreen(),

        },
        theme: MyThemeData.darkTheme,
    );
  }
}
