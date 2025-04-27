import 'package:flutter/material.dart';
import 'package:ldsw_proyecto_movies/models/movie.dart';
import 'package:ldsw_proyecto_movies/screens/edit_movie.dart';
import 'package:ldsw_proyecto_movies/screens/movie_details.dart';
import 'package:ldsw_proyecto_movies/services/movie_service.dart';

class ListaMovies extends StatefulWidget {
  const ListaMovies({super.key});

  @override
  State<StatefulWidget> createState() => _ListaMoviesState();
}

class _ListaMoviesState extends State<ListaMovies> {
  List<Movie> _movies = [];

  @override
  void initState() {
    super.initState();
    _loadMovies();
  }

  Future<void> _loadMovies() async {
    final movies = await MovieService.instance.listMovies();
    setState(() {
      _movies = movies;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todas Las Movies'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => EditMovieScreen(movie: null),
                    ),
                  )
                  .then((m) {
                    if (m != null) _loadMovies();
                  });
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _movies.length,
        itemBuilder: (context, index) {
          final movie = _movies[index];
          return ListTile(
            onTap: () {
              Navigator.of(context)
                  .push(
                    MaterialPageRoute(
                      builder: (context) => MovieDetailsScreen(movie: movie),
                    ),
                  )
                  .then((m) => {if (m != null) _loadMovies()});
            },
            trailing:
                movie.imageUrl.isEmpty ? null : Image.network(movie.imageUrl),
            title: Text(movie.title),
            subtitle: Text(movie.year.toString()),
          );
        },
      ),
    );
  }
}
