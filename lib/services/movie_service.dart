import 'package:ldsw_proyecto_movies/graphql/generated/movies.dart';
import 'package:ldsw_proyecto_movies/models/movie.dart';

class MovieService {
  static final instance = MovieService._();
  MovieService._();

  Future<Movie> getMovie(String movieId) async {
    var result =
        await MoviesConnector.instance
            .getMovie(movieId: GetMovieVariablesMovieId(id: movieId))
            .execute();
    return await Movie.fromJson(result.data.movie!.toJson());
  }

  Future<List<Movie>> listMovies() async {
    var result = await MoviesConnector.instance.listMovies().execute();
    List<Movie> parsedMovies = [];
    for (var m in result.data.movies) {
      Movie parsedMovie = await Movie.fromJson(m.toJson());
      parsedMovies.add(parsedMovie);
    }
    return parsedMovies;
  }

  Future<Movie> createMovie(Movie movieData) async {
    var result =
        await MoviesConnector.instance
            .createMovie(
              title: movieData.title,
              year: movieData.year ?? 0,
              genre: movieData.genre ?? '',
              imageUrl: movieData.imageUrl,
              rating: movieData.rating ?? 0,
              description: movieData.description ?? '',
            )
            .execute();
    var insertedMovie = result.data.movie_insert.toJson();
    return Movie.fromJson(insertedMovie);
  }

  Future<Movie> updateMovie(Movie movieData) async {
    await MoviesConnector.instance
        .updateMovie(
          id: movieData.id,
          title: movieData.title,
          year: movieData.year ?? 0,
          genre: movieData.genre ?? '',
          imageUrl: movieData.imageUrl,
          rating: movieData.rating ?? 0,
          description: movieData.description ?? '',
        )
        .execute();
    return movieData;
  }

  Future<void> deleteMovie(String id) async {
    await MoviesConnector.instance.deleteMovie(id: id).execute();
  }
}
