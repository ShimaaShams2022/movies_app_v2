

import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';
import '../home/popular_poster_with_book_mark_widget.dart';
import 'loading_image.dart';
import 'movie_main_text.dart';

class PopularMoviesAdsWidget extends StatelessWidget {
   PopularMoviesAdsWidget(
       {super.key,required this.adsMovie});

   Results adsMovie;

  @override
  Widget build(BuildContext context) {
    return
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height:MediaQuery.of(context).size.height*0.3,
                child:LoadingImage(imageName: adsMovie.backdropPath, width: 80, height:120,)
                //Image.network('https://image.tmdb.org/t/p/w500${adsMovie.backdropPath}')

              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width*0.0001),
                  MovieMainText(
                    adsMovie: adsMovie,
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height*0.00001),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15,horizontal:15 ),
            child:  PopularPosterWithBookMarkWidget(
              filmData: adsMovie,

            ),
          )
        ],
      );
  }
}
