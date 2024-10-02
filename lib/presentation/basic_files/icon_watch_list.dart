import 'package:flutter/material.dart';
import 'package:movies_app_v2/presentation/basic_files/icon_in_watch_list.dart';
import 'package:movies_app_v2/presentation/basic_files/icon_out_watch_list.dart';
import 'package:provider/provider.dart';
import '../../data/api_model/Results.dart';
import '../../data/firestore_database/movie.dart';
import '../../data/firestore_database/movie_provider.dart';

class IconWatchList extends StatefulWidget {
  IconWatchList({required this.movieResults, super.key});

  final Results movieResults;

  @override
  State<IconWatchList> createState() => _IconInWatchListState();
}

class _IconInWatchListState extends State<IconWatchList> {

  bool? isInWatchlist; // Store the watchlist state
  bool isLoading = true; // Loading state

  @override
  void initState() {
    super.initState();
    checkWatchlist(); // Check watchlist on init
  }

  Future<void> checkWatchlist() async {
    final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
    bool exists = await moviesProvider.checkWatchlist(widget.movieResults.id.toString());
    setState(() {
      isInWatchlist = exists; // Update state
      isLoading = false; // Stop loading
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return CircularProgressIndicator(); // Show loading indicator while fetching data
    }

    return InkWell(
      onTap: () async {
        final moviesProvider = Provider.of<MovieProvider>(context, listen: false);
        Movie movie = Movie(
          id: widget.movieResults.id.toString(),
          title: widget.movieResults.title,
          date: widget.movieResults.releaseDate,
          posterName: widget.movieResults.posterPath,
          isInWatchList: isInWatchlist ,
        );

        await moviesProvider.toggleWatchlist(movie); // Toggle watchlist
        setState(() {
          isInWatchlist = !isInWatchlist!; // Update local state
        });
      },
      child: isInWatchlist == true ? IconOutWatchList():IconInWatchList()

    );
  }
}