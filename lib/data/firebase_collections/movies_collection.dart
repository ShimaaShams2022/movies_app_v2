import 'package:movies_app_v2/data/firestore_model/movies_database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MoviesCollection {

  CollectionReference<SavedMovie> getMoviesCollection() {
    var db = FirebaseFirestore.instance;

    return db.collection("SavedWatchList").withConverter(
        fromFirestore: (snapshot, options) {
          return SavedMovie.fromFireStore(snapshot.data());
        }, toFirestore: (obj, options) {
      return obj.toFireStore();
    });
  }

  Future<void> createMovie(SavedMovie movie)  {
    //write Movie in Movies collection
    return getMoviesCollection().doc(movie.movieId).set(movie);
  }

  Future<void> removeMovie(SavedMovie movie) {
    var docRef=getMoviesCollection().doc(movie.movieId??"");
    return docRef.delete();
  }

  Future<List<SavedMovie>> getAllMovies() async {
    var userQuerySnapShot=await getMoviesCollection().get();
    var moviesList = userQuerySnapShot.docs.map((docSnapshot)=>docSnapshot.data()).toList();
    return moviesList;
  }

  Future<void> checkIfInWatchlist(SavedMovie movie) async {

    final FirebaseFirestore db = FirebaseFirestore.instance;

    var doc = await db
        .collection('movies')
        .doc(movie.movieId)
        .get();

    if (doc.exists) {
      movie.isInWatchList = true;

    } else {
       movie.isInWatchList= false;
    }


  }


}