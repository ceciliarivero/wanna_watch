import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import '../mappers/movie_to_watch_request_body.dart';
import '../mappers/movie_to_watch_response.dart';

class DBApiClient {
  DBApiClient(this._dbApiClient);

  final FirebaseFirestore _dbApiClient;
  final moviesCollection = dotenv.env['WATCH_LIST_COLLECTION']!;

  Future<void> addMovieToWatchList(MovieToWatchWrapperRequestBody movie) async {
    await _dbApiClient.collection(moviesCollection).add(movie.data.toJson());
  }

  Future<void> removeMovieFromWatchList(int id) async {
    _dbApiClient
        .collection(moviesCollection)
        .where("id", isEqualTo: id)
        .get()
        .then(
      (querySnapshot) {
        for (var docSnapshot in querySnapshot.docs) {
          _dbApiClient
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
    return _dbApiClient.collection(moviesCollection).get().then(
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
