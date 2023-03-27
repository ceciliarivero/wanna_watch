import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './firebase_options.dart';

import './data/apis/db_client.dart';
import './data/apis/movies_api_client.dart';
import './data/repositories/movies_repository.dart';

import './screens/movies_screen/movies_screen.dart';

import './themes/movies_theme.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  final moviesApiBaseURL = dotenv.env['MOVIES_API_BASE_URL'];

  WidgetsFlutterBinding.ensureInitialized();

  // Movies Api
  final moviesDio = Dio(
    BaseOptions(baseUrl: moviesApiBaseURL ?? ''),
  );

  final moviesApiClient = MoviesApiClient(moviesDio);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Watch List DB
  final FirebaseFirestore dbInstance = FirebaseFirestore.instance;

  final dbClient = DBClient(dbInstance);

  final moviesRepository = MoviesRepository(moviesApiClient, dbClient);

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
