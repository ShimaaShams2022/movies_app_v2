

import 'package:flutter/material.dart';
import 'package:movies_app_v2/data/firestore_model/movies_database.dart';
import 'package:provider/provider.dart';

import '../firebase_collections/movies_collection.dart';

class MoviesProvider extends ChangeNotifier {

  var moviesCollection = MoviesCollection();

  Future<List<SavedMovie>> getAllMovies() async {
    var moviesList = await moviesCollection.getAllMovies();
    return moviesList;
  }

  Future<void> removeMovie(SavedMovie movie) async {
    await moviesCollection.removeMovie(movie);
    notifyListeners();
    return;
  }

  Future<void> addMovie(SavedMovie movie) async {
    await moviesCollection.createMovie(movie);
    notifyListeners();
    return;
  }

  static MoviesProvider getInstance(BuildContext context, {bool listen = true}) {
    return Provider.of<MoviesProvider>(context, listen: listen);
  }

  Future<bool?> checkMovie(SavedMovie movie) async {
    await moviesCollection.checkIfInWatchlist(movie);
    notifyListeners();
    return movie.isInWatchList;
  }

}