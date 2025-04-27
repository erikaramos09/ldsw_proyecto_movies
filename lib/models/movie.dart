class Movie {
  final String id;
  final String title;
  int? year;
  String? genre;
  final String imageUrl;
  int? rating;
  String? description;

  Movie({
    required this.id,
    required this.title,
    this.year,
    this.genre,
    required this.imageUrl,
    this.rating,
    this.description,
  });

  static Future<Movie> fromJson(Map<String, dynamic> insertedMovie) async {
    return Movie(
      id: insertedMovie['id'],
      title: insertedMovie['title'] ?? '',
      year: insertedMovie['year'] ?? 0,
      genre: insertedMovie['genre'] ?? '',
      imageUrl: insertedMovie['imageUrl'] ?? '',
      rating: insertedMovie['rating'] ?? 0,
      description: insertedMovie['description'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'year': year,
      'genre': genre,
      'imageUrl': imageUrl,
      'rating': rating,
      'description': description,
    };
  }
}
