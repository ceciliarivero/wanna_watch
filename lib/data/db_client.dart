import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import './movie_to_watch_request_body.dart';
import './movie_to_watch_response.dart';

class DBClient {
  final FirebaseFirestore _dbClient;
  final moviesCollection = dotenv.env['WATCH_LIST_COLLECTION']!;

  DBClient(this._dbClient);

  Future<void> addMovieToWatchList(MovieToWatchWrapperRequestBody movie) async {
    await _dbClient.collection(moviesCollection).add(movie.data.toJson());
  }

  Future<void> removeMovieFromWatchList(int id) async {
    _dbClient
        .collection(moviesCollection)
        .where("id", isEqualTo: id)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          _dbClient
              .collection(moviesCollection)
              .doc(docSnapshot.id)
              .delete()
              .then(
                (doc) => doc,
                onError: (error) => Error.safeToString(error),
              )
              .then((value) => getMoviesFromWatchList());
        }
      },
      onError: (error) => Error.safeToString(error),
    );
  }

  Future<List<MovieToWatchResponse>> getMoviesFromWatchList() async {
    return _dbClient.collection(moviesCollection).get().then(
      (querySnapshot) {
        final items = (querySnapshot.docs);

        return items
            .map<MovieToWatchResponse>(
                (item) => MovieToWatchResponse.fromJson(item.data()))
            .toList();
      },
      onError: (error) =>
          Error.safeToString('Error fetching movies to watch list: $error'),
    );
  }
}
