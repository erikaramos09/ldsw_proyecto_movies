library movies;

import 'package:firebase_data_connect/firebase_data_connect.dart';
import 'dart:convert';

part 'create_movie.dart';

part 'update_movie.dart';

part 'delete_movie.dart';

part 'list_movies.dart';

part 'get_movie.dart';

class MoviesConnector {
  CreateMovieVariablesBuilder createMovie({
    required String title,
    required int year,
    required String genre,
    required String imageUrl,
    int? rating,
    String? description,
  }) {
    return CreateMovieVariablesBuilder(
      dataConnect,
      title: title,
      year: year,
      genre: genre,
      imageUrl: imageUrl,
    );
  }

  UpdateMovieVariablesBuilder updateMovie({
    required String id,
    required String title,
    required int year,
    required String genre,
    required String imageUrl,
    required int rating,
    required String description,
  }) {
    return UpdateMovieVariablesBuilder(
      dataConnect,
      id: id,
      title: title,
      year: year,
      genre: genre,
      imageUrl: imageUrl,
      rating: rating,
      description: description,
    );
  }

  DeleteMovieVariablesBuilder deleteMovie({required String id}) {
    return DeleteMovieVariablesBuilder(dataConnect, id: id);
  }

  ListMoviesVariablesBuilder listMovies() {
    return ListMoviesVariablesBuilder(dataConnect);
  }

  GetMovieVariablesBuilder getMovie({
    required GetMovieVariablesMovieId movieId,
  }) {
    return GetMovieVariablesBuilder(dataConnect, movieId: movieId);
  }

  static ConnectorConfig connectorConfig = ConnectorConfig(
    'us-west1',
    'movies',
    'proyecto-movies-db-connect',
  );

  MoviesConnector({required this.dataConnect});
  static MoviesConnector get instance {
    return MoviesConnector(
      dataConnect: FirebaseDataConnect.instanceFor(
        connectorConfig: connectorConfig,
        sdkType: CallerSDKType.generated,
      ),
    );
  }

  FirebaseDataConnect dataConnect;
}
