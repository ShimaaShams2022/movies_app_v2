import 'package:flutter/material.dart';

import 'utilities.dart';


class LoadingSmallImage extends StatelessWidget {
   LoadingSmallImage({required this.imageName,super.key});

  String? imageName;

  @override
  Widget build(BuildContext context) {
    if ( imageName != null){
     return SizedBox(
         width: MediaQuery.of(context).size.width*0.22,
         height: MediaQuery.of(context).size.width*0.28,
         child: Image.network('https://image.tmdb.org/t/p/w500$imageName',
          fit: BoxFit.fill,
     )
    );
    }
    else {
      return SizedBox(
        width: MediaQuery.of(context).size.width*0.22,
        height: MediaQuery.of(context).size.width*0.28,
          child: Image.asset(getFullPathImage("no_poster_available.jpg"),
          fit: BoxFit.fill,
          ),
      );
    }
  }
}
