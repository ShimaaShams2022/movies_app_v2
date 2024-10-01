String getFullPathImage(String imageName) {
  return "assets/images/$imageName";
}

String roundedNumber(num vote) {

  String roundNum=(vote as double).toStringAsFixed(1);

  return roundNum;
}

String splitYear(String date){
  String year=date.split('-').first;
  return year;
}

bool checkInWatchList(String movieId){
  List<String> watchListId=[];
  for(var i=0;i<watchListId.length;i++){
    if(watchListId[i]==movieId){
      return true ;
    }
  }
  return false;
}
