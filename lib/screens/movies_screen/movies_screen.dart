import 'package:flutter/material.dart';

import '../../data/models/movie.dart';
import '../../data/repositories/movies_repository.dart';

import '../../shared_widgets/bottom_nav_bar.dart';
import './widgets/movie_list.dart';
import './widgets/watch_list.dart';

class MoviesScreen extends StatefulWidget {
  const MoviesScreen({
    super.key,
    required this.moviesRepository,
  });

  final MoviesRepository moviesRepository;

  @override
  State<MoviesScreen> createState() => _MoviesState();
}

class _MoviesState extends State<MoviesScreen> {
  int _selectedScreenIndex = 0;
  late Future<List<Movie>> _watchListFuture;
  late Future<List<Movie>> _moviesFuture;

  @override
  void initState() {
    super.initState();

    _watchListFuture = widget.moviesRepository.getMoviesFromWatchList();
    _moviesFuture = widget.moviesRepository.getMovies();
  }

  void _onTap(int index) {
    setState(() {
      _selectedScreenIndex = index;
      _watchListFuture = widget.moviesRepository.getMoviesFromWatchList();
      _moviesFuture = widget.moviesRepository.getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final List<Widget> screenOptions = <Widget>[
      SafeArea(
        child: MovieList(
          watchListFuture: _watchListFuture,
          moviesFuture: _moviesFuture,
          moviesRepository: widget.moviesRepository,
        ),
      ),
      SafeArea(
        child: WatchList(
          moviesRepository: widget.moviesRepository,
          watchListFuture: _watchListFuture,
        ),
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.primaryColor,
        title: const Text('Wanna Watch'),
        centerTitle: true,
      ),
      body: Center(
        child: screenOptions.elementAt(_selectedScreenIndex),
      ),
      bottomNavigationBar: BottomNavBar(
        selectedScreenIndex: _selectedScreenIndex,
        onTap: _onTap,
      ),
    );
  }
}
