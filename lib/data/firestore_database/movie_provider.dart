
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie.dart';
import 'movies_collection.dart';

class MovieProvider extends ChangeNotifier{

  var moviesCollection= MoviesCollection();

  Future<List<Movie>> getAllMovies() async {
    var moviesList= await moviesCollection.getAllMovies();
    return moviesList;
  }
  Future<void> removeMovie(Movie movie) async {
    await moviesCollection.removeMovie(movie);
    notifyListeners();
    return;
  }
  Future<bool> movieInWatchList(Movie movie) async {
    bool check= await moviesCollection.movieInWatchList(movie);
    notifyListeners();
    return  check;
  }
  Future<void> addMovie(Movie movie)async{
    await moviesCollection.addMovie(movie);
    notifyListeners();
    return;
  }

  static MovieProvider getInstance(BuildContext context,{bool listen=true}){
    return Provider.of<MovieProvider>(context,listen: listen);
  }

}