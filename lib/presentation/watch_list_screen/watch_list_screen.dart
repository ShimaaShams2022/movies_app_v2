import 'package:flutter/material.dart';
import 'package:movies_app_v2/presentation/watch_list_screen/watch_list_movie_widget.dart';
import 'package:movies_app_v2/presentation/watch_list_screen/watch_list_view_model.dart';
import 'package:provider/provider.dart';

import '../basic_files/my_theme/my_theme_data.dart';


class WatchListScreen extends StatelessWidget {
  const WatchListScreen({super.key});
  static const String routeName = "WatchScreen";
  @override
  Widget build(BuildContext context) {

    var watchlistViewModel = Provider.of<WatchlistViewModel>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        Padding(
          padding:
              const EdgeInsets.only(top: 0, bottom: 0, left: 25, right: 10),
          child: Text("Watch List",
              style: MyThemeData.darkTheme.textTheme.headlineMedium),
        ),
        StreamBuilder<List<Map<String, dynamic>>>(
            stream: watchlistViewModel.getWatchlist(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }

              if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No movies in Watchlist'));
              }

              var movies = snapshot.data!;

              return ListView.builder(
                  itemCount: movies.length,
                  itemBuilder: (context, index) {
                    var movie = movies[index];

                    return WatchListMovieWidget(imageName: movie['posterPath']);
                  });
            })

        // WatchAllListWidget(),
      ],
    );
  }
}
