import 'package:flutter/material.dart';
import 'package:ldsw_proyecto_movies/models/movie.dart';
import 'package:ldsw_proyecto_movies/services/movie_service.dart';

class EditMovieScreen extends StatefulWidget {
  final Movie? movie;

  const EditMovieScreen({super.key, this.movie});

  @override
  State<EditMovieScreen> createState() => _EditMovieScreenState();
}

class _EditMovieScreenState extends State<EditMovieScreen> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _yearController = TextEditingController();
  final _genreController = TextEditingController();
  final _imageUrlController = TextEditingController();
  final _ratingController = TextEditingController();
  final _descriptionController = TextEditingController();

  bool get _isNewMovie => widget.movie == null;

  @override
  void initState() {
    super.initState();
    if (!_isNewMovie) {
      _titleController.text = widget.movie!.title;
      _yearController.text = widget.movie!.year.toString();
      _genreController.text = widget.movie!.genre ?? '';
      _imageUrlController.text = widget.movie!.imageUrl;
      _ratingController.text = widget.movie!.rating.toString();
      _descriptionController.text = widget.movie!.description ?? '';
    }
  }

  Future<Movie> _submitForm() async {
    final Movie m = Movie(
      id: _isNewMovie ? '' : widget.movie!.id,
      title: _titleController.text,
      year: int.parse(_yearController.text),
      genre: _genreController.text,
      imageUrl: _imageUrlController.text,
      rating: int.parse(_ratingController.text),
      description: _descriptionController.text,
    );
    if (_isNewMovie) {
      return MovieService.instance.createMovie(m);
    } else {
      return MovieService.instance.updateMovie(m);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Editar La Movie')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(
                  labelText: 'Título',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un título';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _yearController,
                decoration: const InputDecoration(
                  labelText: 'Año',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _genreController,
                decoration: const InputDecoration(
                  labelText: 'Género',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _imageUrlController,
                decoration: const InputDecoration(
                  labelText: 'URL de imagen',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese una URL de imagen';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _ratingController,
                decoration: const InputDecoration(
                  labelText: 'Rating',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Por favor ingrese un rating';
                  }
                  if (int.tryParse(value) == null) {
                    return 'Por favor ingrese un rating valido';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _descriptionController,
                decoration: const InputDecoration(
                  labelText: 'Descripción',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        Movie m = await _submitForm();
                        Navigator.of(context).pop(m);
                      }
                    },
                    child: Text(_isNewMovie ? 'Crear' : 'Actualizar'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Cancelar'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
