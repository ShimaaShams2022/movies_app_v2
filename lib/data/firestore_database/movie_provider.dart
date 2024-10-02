
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'movie.dart';
import 'movies_collection.dart';

class MovieProvider extends ChangeNotifier{

  bool isBooked=false;


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



  Future<bool> toggleWatchlist(Movie movie) async {
    DocumentSnapshot doc= await FirebaseFirestore.instance.collection('Movies').doc(movie.id).get();

    if (doc.exists) {
      await  moviesCollection.removeMovie(movie);
      isBooked=false;
      return false;  // Movie was removed from the watchlist
    } else {
      await moviesCollection.addMovie(movie);
      isBooked=true;
      return true;
    }
       // Movie was added to the watchlist
    }


  Future<bool> checkWatchlist(String movieId) async {
    DocumentSnapshot doc= await FirebaseFirestore.instance.collection('Movies').doc(movieId).get();

    if (doc.exists) {
      return false;  // Movie was removed from the watchlist
    } else {

      return true;
    }
    // Movie was added to the watchlist
  }




  static MovieProvider getInstance(BuildContext context,{bool listen=true}){
    return Provider.of<MovieProvider>(context,listen: listen);
  }

}