
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';

class WatchlistViewModel extends ChangeNotifier {


  final FirebaseFirestore fireStore = FirebaseFirestore.instance;


  Future<bool> checkIfInWatchlist(String movieId,bool inWatchList) async {
    var doc = await fireStore
        .collection('movies')
        .doc(movieId)
        .get();

    if (doc.exists) {
      notifyListeners();
     return inWatchList = true;

    } else {
      notifyListeners();
      return inWatchList= false;

    }


  }

  Future<bool> toggleWatchlist(String movieId, String title,
      String posterPath,bool inWatchList) async {
    if (inWatchList) {
      // Remove from watchlist
      await fireStore
          .collection('movies')
          .doc(movieId)
          .delete();
      notifyListeners();
      return inWatchList = false;
    } else {
      // Add to watchlist
      await fireStore
          .collection('movies')
          .doc(movieId)
          .set({
        'title': title,
        'posterPath': posterPath,
      });
      notifyListeners();
      return inWatchList = true;
    }

  }

  Stream<List<Map<String, dynamic>>> getWatchlist() {
    return fireStore
        .collection('movies')
        .snapshots()
        .map((snapshot) =>
        snapshot.docs
            .map((doc) =>
        {
          'movieId': doc.id,
          'title': doc['title'],
          'posterPath': doc['posterPath']
        })
            .toList());
  }
}

