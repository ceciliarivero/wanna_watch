import 'package:flutter/material.dart';

import '../data/movie.dart';
import '../data/movies_repository.dart';

import '../widgets/movie_list/movie_list.dart';
import '../widgets/movie_list/watch_list.dart';

class MoviesScreen extends StatefulWidget {
  final MoviesRepository moviesRepository;

  const MoviesScreen({
    super.key,
    required this.moviesRepository,
  });

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedScreenIndex = index;
      _watchListFuture = widget.moviesRepository.getMoviesFromWatchList();
      _moviesFuture = widget.moviesRepository.getMovies();
    });
  }

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Theme.of(context).primaryColor,
        title: const Text('Wanna Watch'),
        centerTitle: true,
      ),
      body: Center(
        child: screenOptions.elementAt(_selectedScreenIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'My list',
          ),
        ],
        currentIndex: _selectedScreenIndex,
        selectedItemColor: Colors.white,
        unselectedItemColor: Theme.of(context).secondaryHeaderColor,
        onTap: _onItemTapped,
        backgroundColor: Theme.of(context).primaryColorDark,
        unselectedFontSize: 15.0,
        selectedFontSize: 15.0,
        iconSize: 30,
      ),
    );
  }
}
