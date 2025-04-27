part of 'movies.dart';

class UpdateMovieVariablesBuilder {
  String id;
  String title;
  int year;
  String genre;
  String imageUrl;
  int rating;
  String description;

  final FirebaseDataConnect _dataConnect;
  UpdateMovieVariablesBuilder(this._dataConnect, {required  this.id,required  this.title,required  this.year,required  this.genre,required  this.imageUrl,required  this.rating,required  this.description,});
  Deserializer<UpdateMovieData> dataDeserializer = (dynamic json)  => UpdateMovieData.fromJson(jsonDecode(json));
  Serializer<UpdateMovieVariables> varsSerializer = (UpdateMovieVariables vars) => jsonEncode(vars.toJson());
  Future<OperationResult<UpdateMovieData, UpdateMovieVariables>> execute() {
    return ref().execute();
  }

  MutationRef<UpdateMovieData, UpdateMovieVariables> ref() {
    UpdateMovieVariables vars= UpdateMovieVariables(id: id,title: title,year: year,genre: genre,imageUrl: imageUrl,rating: rating,description: description,);
    return _dataConnect.mutation("UpdateMovie", dataDeserializer, varsSerializer, vars);
  }
}

class UpdateMovieMovieUpdate {
  String id;
  UpdateMovieMovieUpdate.fromJson(dynamic json):
  id = nativeFromJson<String>(json['id']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    return json;
  }

  UpdateMovieMovieUpdate({
    required this.id,
  });
}

class UpdateMovieData {
  UpdateMovieMovieUpdate? movie_update;
  UpdateMovieData.fromJson(dynamic json):
  movie_update = json['movie_update'] == null ? null : UpdateMovieMovieUpdate.fromJson(json['movie_update']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    if (movie_update != null) {
      json['movie_update'] = movie_update!.toJson();
    }
    return json;
  }

  UpdateMovieData({
    this.movie_update,
  });
}

class UpdateMovieVariables {
  String id;
  String title;
  int year;
  String genre;
  String imageUrl;
  int rating;
  String description;
  @Deprecated('fromJson is deprecated for Variable classes as they are no longer required for deserialization.')
  UpdateMovieVariables.fromJson(Map<String, dynamic> json):
  id = nativeFromJson<String>(json['id']),title = nativeFromJson<String>(json['title']),year = nativeFromJson<int>(json['year']),genre = nativeFromJson<String>(json['genre']),imageUrl = nativeFromJson<String>(json['imageUrl']),rating = nativeFromJson<int>(json['rating']),description = nativeFromJson<String>(json['description']);

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json['id'] = nativeToJson<String>(id);
    json['title'] = nativeToJson<String>(title);
    json['year'] = nativeToJson<int>(year);
    json['genre'] = nativeToJson<String>(genre);
    json['imageUrl'] = nativeToJson<String>(imageUrl);
    json['rating'] = nativeToJson<int>(rating);
    json['description'] = nativeToJson<String>(description);
    return json;
  }

  UpdateMovieVariables({
    required this.id,
    required this.title,
    required this.year,
    required this.genre,
    required this.imageUrl,
    required this.rating,
    required this.description,
  });
}

