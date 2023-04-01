import 'package:flutter/material.dart';

import './data/repositories/movies_repository.dart';

import './screens/movies_screen/movies_screen.dart';

import './themes/movies_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final moviesRepository = await initMoviesRepository();

  runApp(
    App(moviesRepository: moviesRepository),
  );
}

class App extends StatelessWidget {
  final MoviesRepository moviesRepository;

  const App({
    super.key,
    required this.moviesRepository,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wanna Watch',
      theme: MoviesTheme().dark,
      home: MoviesScreen(
        moviesRepository: moviesRepository,
      ),
    );
  }
}
