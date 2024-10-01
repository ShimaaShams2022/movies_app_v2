import 'package:movies_app_v2/data/api_model/Results.dart';

class SavedMovie {
 String? movieName;
 String? movieDate;
 String? movieId;
 String? movieImage;
 bool? isInWatchList;

  SavedMovie({
    required this.movieName,
    required this.movieDate,
    required this.movieId,
    required this.movieImage,
    required this.isInWatchList
  });

  SavedMovie.fromFireStore(Map<String, dynamic>? dataFromDataBase)
      : this(
    movieImage: dataFromDataBase?['movieImage'],
    movieId: dataFromDataBase?['movieId'],
    movieDate: dataFromDataBase?['movieDate'],
    movieName: dataFromDataBase?['movieName'],
    isInWatchList: dataFromDataBase?['isInWatchList'],
  );

  Map<String, dynamic> toFireStore() {
    return {
      "movieImage":movieImage,
      "movieId": movieId,
      "movieDate": movieDate,
      "movieName":movieName,
      "isInWatchList":isInWatchList,
    };
  }
}
