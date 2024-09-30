import 'dart:async';
import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';
import 'popular_movies_ads_widget.dart';



class CustomAdsWidget extends StatelessWidget {
  List<Results> popularResults;
  final int currentIndex;
  final Timer timer;

   CustomAdsWidget(
       {required this.popularResults,
    super.key,
    required this.currentIndex,
    required this.timer,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Stack(
        children: [
          AnimatedSwitcher(
            switchInCurve:Curves.easeInOut ,
            switchOutCurve: Curves.fastOutSlowIn,
            duration: const Duration(seconds: 5),
            transitionBuilder: (Widget child,Animation<double> animation){
             return FadeTransition(opacity: animation,child: child);
            },
            child:PopularMoviesAdsWidget(adsMovie: popularResults[currentIndex],
              key:  ValueKey<int>(currentIndex),)
          ),
        ],
      ),
    );
  }
}
