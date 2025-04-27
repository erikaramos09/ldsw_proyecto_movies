part of 'movies.dart';

class CreateMovieVariablesBuilder {
  String title;
  int year;
  String genre;
  String imageUrl;
  Optional<int> _rating = Optional.optional(nativeFromJson, nativeToJson);
  Optional<String> _description = Optional.optional(
    nativeFromJson,
    nativeToJson,
  );

  final FirebaseDataConnect _dataConnect;
  CreateMovieVariablesBuilder rating(int? t) {
    _rating.value = t;
    return this;
  }

  CreateMovieVariablesBuilder description(String? t) {
    _description.value = t;
    return this;
  }

  CreateMovieVariablesBuilder(
    this._dataConnect, {
    required this.title,
    required this.year,
    required this.genre,
    required this.imageUrl,
  });
  Deserializer<CreateMovieData> dataDeserializer =
      (dynamic json) => CreateMovieData.fromJson(jsonDecode(json));
  Serializer<CreateMovieVariables> varsSerializer =
      (CreateMovieVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<CreateMovieData, CreateMovieVariables>> execute() {
    return ref().execute();
  }

  MutationRef<CreateMovieData, CreateMovieVariables> ref() {
    CreateMovieVariables vars = CreateMovieVariables(
      title: title,
      year: year,
      genre: genre,
      imageUrl: imageUrl,
      rating: _rating,
      description: _description,
    );
    return _dataConnect.mutation(
      "CreateMovie",
      dataDeserializer,
      varsSerializer,
      vars,
    );
  }
}

class CreateMovieMovieInsert {
  String id;
  CreateMovieMovieInsert.fromJson(dynamic json)
    : id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  CreateMovieMovieInsert({required this.id});
}

class CreateMovieData {
  CreateMovieMovieInsert movie_insert;
  CreateMovieData.fromJson(dynamic json)
    : movie_insert = CreateMovieMovieInsert.fromJson(json['movie_insert']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['movie_insert'] = movie_insert.toJson();
    return json;
  }

  CreateMovieData({required this.movie_insert});
}

class CreateMovieVariables {
  String title;
  int year;
  String genre;
  String imageUrl;
  late Optional<int> rating;
  late Optional<String> description;
  @Deprecated(
    'fromJson is deprecated for Variable classes as they are no longer required for deserialization.',
  )
  CreateMovieVariables.fromJson(Map<String, dynamic> json)
    : title = nativeFromJson<String>(json['title']),
      year = nativeFromJson<int>(json['year']),
      genre = nativeFromJson<String>(json['genre']),
      imageUrl = nativeFromJson<String>(json['imageUrl']) {
    rating = Optional.optional(nativeFromJson, nativeToJson);
    rating.value =
        json['rating'] == null ? null : nativeFromJson<int>(json['rating']);

    description = Optional.optional(nativeFromJson, nativeToJson);
    description.value =
        json['description'] == null
            ? null
            : nativeFromJson<String>(json['description']);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['title'] = nativeToJson<String>(title);
    json['year'] = nativeToJson<int>(year);
    json['genre'] = nativeToJson<String>(genre);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    if (rating.state == OptionalState.set) {
      json['rating'] = rating.toJson();
    }
    if (description.state == OptionalState.set) {
      json['description'] = description.toJson();
    }
    return json;
  }

  CreateMovieVariables({
    required this.title,
    required this.year,
    required this.genre,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });
}
