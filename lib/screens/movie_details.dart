import 'package:flutter/material.dart';
import 'package:ldsw_proyecto_movies/models/movie.dart';
import 'package:ldsw_proyecto_movies/screens/edit_movie.dart';
import 'package:ldsw_proyecto_movies/services/movie_service.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late Movie _movie;
  String get _movieId => _movie.id;

  @override
  void initState() {
    _movie = widget.movie;
    super.initState();
    _loadMovie();
  }

  Future<void> _loadMovie() async {
    final m = await MovieService.instance.getMovie(_movieId);
    setState(() {
      _movie = m;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_movie.title),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop(_movie);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              var n = Navigator.of(context);
              // Navigate to edit movie screen
              n
                  .push(
                    MaterialPageRoute(
                      builder: (context) => EditMovieScreen(movie: _movie),
                    ),
                  )
                  .then((movie) {
                    if (movie != null) {
                      _loadMovie(); // Trigger _loadMovie if a movie is returned
                    }
                  });
            },
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () {
              _showDeleteConfirmationDialog(context);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          if (_movie.imageUrl.isNotEmpty) Image.network(_movie.imageUrl),
          const SizedBox(height: 16),
          Text('Año: ${_movie.year}'),
          Text('Género: ${_movie.genre}'),
          Text('Rating: ${_movie.rating}'),
          Text('Descripción: ${_movie.description}'),
        ],
      ),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirmación de eliminar'),
          content: const Text('Estas seguro de querer borrar esta movie?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () async {
                await MovieService.instance.deleteMovie(_movie.id);
                Navigator.of(context).pop(_movie);
                Navigator.of(context).pop(_movie);
              },
              child: const Text('Eliminar'),
            ),
          ],
        );
      },
    );
  }
}
