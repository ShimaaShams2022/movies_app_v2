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