
import 'package:cloud_firestore/cloud_firestore.dart';
import 'movie.dart';

class MoviesCollection {

  CollectionReference<Movie> getMoviesCollection() {
    var db = FirebaseFirestore.instance;

    return db.collection("Movies").withConverter(
        fromFirestore: (snapshot, options) {
          return Movie.fromFireStore(snapshot.data());
        }, toFirestore: (Movie, options) {
      return Movie.toFireStore();
    });
  }

  Future<void> addMovie(Movie movie){
    var docRef=getMoviesCollection().doc(movie.id.toString());
    movie.isInWatchList=true;
    return docRef.set(movie);


  }

  Future<List<Movie>> getAllMovies() async {
    var userQuerySnapShot=await getMoviesCollection().get();
    var tasksList = userQuerySnapShot.docs.map((docSnapshot)=>docSnapshot.data()).toList();
    return tasksList;
  }


  Future<void> removeMovie(Movie movie) {
    var docRef=getMoviesCollection().doc(movie.id);
    return docRef.delete();

  }

  Future<bool> movieInWatchList(Movie movie)async {
    try {
      final docSnapshot=await FirebaseFirestore.
      instance.collection('movies')
          .doc(movie.id).get();
      if (docSnapshot.exists){return true;}
      else{
        return false;
      }

    }catch(exception){
      return false;
    }

  }


}
