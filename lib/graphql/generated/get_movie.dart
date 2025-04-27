part of 'movies.dart';

class GetMovieVariablesBuilder {
  GetMovieVariablesMovieId movieId;

  final FirebaseDataConnect _dataConnect;
  GetMovieVariablesBuilder(this._dataConnect, {required  this.movieId,});
  Deserializer<GetMovieData> dataDeserializer = (dynamic json)  => GetMovieData.fromJson(jsonDecode(json));
  Serializer<GetMovieVariables> varsSerializer = (GetMovieVariables vars) => jsonEncode(vars.toJson());
  Future<QueryResult<GetMovieData, GetMovieVariables>> execute() {
    return ref().execute();
  }

  QueryRef<GetMovieData, GetMovieVariables> ref() {
    GetMovieVariables vars= GetMovieVariables(movieId: movieId,);
    return _dataConnect.query("GetMovie", dataDeserializer, varsSerializer, vars);
  }
}

class GetMovieMovie {
  String id;
  int? year;
  String title;
  String imageUrl;
  int? rating;
  String? genre;
  String? description;
  GetMovieMovie.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']),year = json['year'] == null ? null : nativeFromJson<int>(json['year']),title = nativeFromJson<String>(json['title']),imageUrl = nativeFromJson<String>(json['imageUrl']),rating = json['rating'] == null ? null : nativeFromJson<int>(json['rating']),genre = json['genre'] == null ? null : nativeFromJson<String>(json['genre']),description = json['description'] == null ? null : nativeFromJson<String>(json['description']);

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
    if (genre != null) {
      json['genre'] = nativeToJson<String?>(genre);
    }
    if (description != null) {
      json['description'] = nativeToJson<String?>(description);
    }
    return json;
  }

  GetMovieMovie({
    required this.id,
    this.year,
    required this.title,
    required this.imageUrl,
    this.rating,
    this.genre,
    this.description,
  });
}

class GetMovieData {
  GetMovieMovie? movie;
  GetMovieData.fromJson(dynamic json):
  movie = json['movie'] == null ? null : GetMovieMovie.fromJson(json['movie']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (movie != null) {
      json['movie'] = movie!.toJson();
    }
    return json;
  }

  GetMovieData({
    this.movie,
  });
}

class GetMovieVariablesMovieId {
  String id;
  GetMovieVariablesMovieId.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  GetMovieVariablesMovieId({
    required this.id,
  });
}

class GetMovieVariables {
  GetMovieVariablesMovieId movieId;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  GetMovieVariables.fromJson(Map<String, dynamic> json):
  movieId = GetMovieVariablesMovieId.fromJson(json['movieId']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movieId'] = movieId.toJson();
    return json;
  }

  GetMovieVariables({
    required this.movieId,
  });
}

