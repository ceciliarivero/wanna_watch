import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './data/movies_api_client.dart';
import './data/network_movies_repository.dart';
import './data/movies_repository.dart';

import './screens/movies.dart';

import './themes/movies_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final moviesApiBaseURL = dotenv.env['MOVIES_API_BASE_URL'];

  WidgetsFlutterBinding.ensureInitialized();

  final moviesDio = Dio(
    BaseOptions(baseUrl: moviesApiBaseURL ?? ''),
  );

  final moviesApiClient = MoviesApiClient(moviesDio);

  final moviesRepository = NetworkMoviesRepository(moviesApiClient);

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
      home: Movies(
        moviesRepository: moviesRepository,
      ),
    );
  }
}
