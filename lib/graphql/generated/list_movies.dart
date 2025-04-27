part of 'movies.dart';

class ListMoviesVariablesBuilder {
  
  final FirebaseDataConnect _dataConnect;
  ListMoviesVariablesBuilder(this._dataConnect, );
  Deserializer<ListMoviesData> dataDeserializer = (dynamic json)  => ListMoviesData.fromJson(jsonDecode(json));
  
  Future<QueryResult<ListMoviesData, void>> execute() {
    return ref().execute();
  }

  QueryRef<ListMoviesData, void> ref() {
    
    return _dataConnect.query("ListMovies", dataDeserializer, emptySerializer, null);
  }
}

class ListMoviesMovies {
  String id;
  int? year;
  String title;
  String imageUrl;
  int? rating;
  ListMoviesMovies.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),year = json['year'] == null ? null : nativeFromJson<int>(json['year']),title = nativeFromJson<String>(json['title']),imageUrl = nativeFromJson<String>(json['imageUrl']),rating = json['rating'] == null ? null : nativeFromJson<int>(json['rating']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    if (year != null) {
      json['year'] = nativeToJson<int?>(year);
    }
    json['title'] = nativeToJson<String>(title);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    if (rating != null) {
      json['rating'] = nativeToJson<int?>(rating);
    }
    return json;
  }

  ListMoviesMovies({
    required this.id,
    this.year,
    required this.title,
    required this.imageUrl,
    this.rating,
  });
}

class ListMoviesData {
  List<ListMoviesMovies> movies;
  ListMoviesData.fromJson(dynamic json):
  movies = (json['movies'] as List<dynamic>)
        .map((e) => ListMoviesMovies.fromJson(e))
        .toList();

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movies'] = movies.map((e) => e.toJson()).toList();
    return json;
  }

  ListMoviesData({
    required this.movies,
  });
}

