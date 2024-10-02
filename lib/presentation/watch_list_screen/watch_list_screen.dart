import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/firestore_database/movie.dart';
import '../../data/firestore_database/movie_provider.dart';
import '../basic_files/my_theme/my_theme_data.dart';
import 'watch_all_List_widget.dart';


class WatchListScreen extends StatefulWidget {
  const WatchListScreen({super.key});
  static const String routeName = "WatchScreen";

  @override
  State<WatchListScreen> createState() => _WatchListScreenState();
}

class _WatchListScreenState extends State<WatchListScreen> {
  @override
  Widget build(BuildContext context) {

    var moviesProvider= Provider.of<MovieProvider>(context,listen: true);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
            height: MediaQuery.of(context).size.height*0.1
        ),
        Padding(
          padding: const EdgeInsets.only(top: 0,bottom: 0,left: 25,right:10 ),
          child: Text("Watch List",style: MyThemeData.darkTheme.textTheme.headlineMedium),
        ),
    FutureBuilder<List<Movie>>(
    future:moviesProvider.getAllMovies(),
    builder:(buildContext,snapshot){
      if(snapshot.hasError){
        // handle error
        return Center(child: Column(
          children: [
            const Text("Something went wrong"),
            ElevatedButton(onPressed: (){
              setState(() {

              });
            }, child:Text("Try again"))
          ],
        ));
      }
      if(snapshot.connectionState==ConnectionState.waiting){
        //waiting future data //like await in old code
        return Center(child: CircularProgressIndicator());
      }
      // you have data
      List<Movie>? moviesList=snapshot.data;
       return WatchAllListWidget(moviesList!);
    })
      ],
    );
  }
}
