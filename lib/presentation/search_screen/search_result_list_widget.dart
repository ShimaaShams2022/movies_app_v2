import 'package:flutter/material.dart';

import '../../data/api_model/Results.dart';
import 'search_result_movie_widget.dart';

class SearchResultListWidget extends StatelessWidget {
   SearchResultListWidget({
     required this.resultList,
     super.key});

   List<Results> resultList;


  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: ListView.builder(itemCount:resultList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context,index){
            return SearchResultMovieWidget(film: resultList[index]);
          },
        ),
      ),
    );
  }
}
