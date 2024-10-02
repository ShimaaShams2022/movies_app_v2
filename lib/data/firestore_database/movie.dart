class Movie{
  String? id;
  String? title;
  String? date;
  String? posterName;
  bool? isInWatchList;

  Movie({
    this.id,
    this.title,
    this.date,
    this.posterName,
    this.isInWatchList,
  });

  Movie.fromFireStore(Map<String,dynamic>? data):
        this(
        id:data?["id"],
        title:data?["title"],
        date:data?["date"],
        posterName:data?["posterName"],
        isInWatchList:data?["isInWatchList"],
      );
  Map<String,dynamic> toFireStore(){
    return{
      "id":id,
      "title":title,
      "date":date,
      "posterName":posterName,
      "isInWatchList":isInWatchList
    };
  }
}