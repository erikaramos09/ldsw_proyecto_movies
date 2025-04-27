# movies SDK

## Installation
```sh
flutter pub get firebase_data_connect
flutterfire configure
```
For more information, see [Flutter for Firebase installation documentation](https://firebase.google.com/docs/data-connect/flutter-sdk#use-core).

## Data Connect instance
Each connector creates a static class, with an instance of the `DataConnect` class that can be used to connect to your Data Connect backend and call operations.

### Connecting to the emulator

```dart
String host = 'localhost'; // or your host name
int port = 9399; // or your port number
MoviesConnector.instance.dataConnect.useDataConnectEmulator(host, port);
```

You can also call queries and mutations by using the connector class.
## Queries

### ListMovies
#### Required Arguments
```dart
// No required arguments
MoviesConnector.instance.listMovies().execute();
```



#### Return Type
`execute()` returns a `QueryResult<ListMoviesData, void>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await MoviesConnector.instance.listMovies();
ListMoviesData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
final ref = MoviesConnector.instance.listMovies().ref();
ref.execute();

ref.subscribe(...);
```


### GetMovie
#### Required Arguments
```dart
GetMovieVariablesMovieId movieId = ...;
MoviesConnector.instance.getMovie(
  movieId: movieId,
).execute();
```



#### Return Type
`execute()` returns a `QueryResult<GetMovieData, GetMovieVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

/// Result of a query request. Created to hold extra variables in the future.
class QueryResult<Data, Variables> extends OperationResult<Data, Variables> {
  QueryResult(super.dataConnect, super.data, super.ref);
}

final result = await MoviesConnector.instance.getMovie(
  movieId: movieId,
);
GetMovieData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
GetMovieVariablesMovieId movieId = ...;

final ref = MoviesConnector.instance.getMovie(
  movieId: movieId,
).ref();
ref.execute();

ref.subscribe(...);
```

## Mutations

### CreateMovie
#### Required Arguments
```dart
String title = ...;
int year = ...;
String genre = ...;
String imageUrl = ...;
MoviesConnector.instance.createMovie(
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
).execute();
```

#### Optional Arguments
We return a builder for each query. For CreateMovie, we created `CreateMovieBuilder`. For queries and mutations with optional parameters, we return a builder class.
The builder pattern allows Data Connect to distinguish between fields that haven't been set and fields that have been set to null. A field can be set by calling its respective setter method like below:
```dart
class CreateMovieVariablesBuilder {
  ...
   CreateMovieVariablesBuilder rating(int? t) {
   _rating.value = t;
   return this;
  }
  CreateMovieVariablesBuilder description(String? t) {
   _description.value = t;
   return this;
  }

  ...
}
MoviesConnector.instance.createMovie(
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
)
.rating(rating)
.description(description)
.execute();
```

#### Return Type
`execute()` returns a `OperationResult<CreateMovieData, CreateMovieVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await MoviesConnector.instance.createMovie(
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
);
CreateMovieData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String title = ...;
int year = ...;
String genre = ...;
String imageUrl = ...;

final ref = MoviesConnector.instance.createMovie(
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
).ref();
ref.execute();
```


### UpdateMovie
#### Required Arguments
```dart
String id = ...;
String title = ...;
int year = ...;
String genre = ...;
String imageUrl = ...;
int rating = ...;
String description = ...;
MoviesConnector.instance.updateMovie(
  id: id,
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
  rating: rating,
  description: description,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<UpdateMovieData, UpdateMovieVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await MoviesConnector.instance.updateMovie(
  id: id,
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
  rating: rating,
  description: description,
);
UpdateMovieData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;
String title = ...;
int year = ...;
String genre = ...;
String imageUrl = ...;
int rating = ...;
String description = ...;

final ref = MoviesConnector.instance.updateMovie(
  id: id,
  title: title,
  year: year,
  genre: genre,
  imageUrl: imageUrl,
  rating: rating,
  description: description,
).ref();
ref.execute();
```


### DeleteMovie
#### Required Arguments
```dart
String id = ...;
MoviesConnector.instance.deleteMovie(
  id: id,
).execute();
```



#### Return Type
`execute()` returns a `OperationResult<DeleteMovieData, DeleteMovieVariables>`
```dart
/// Result of an Operation Request (query/mutation).
class OperationResult<Data, Variables> {
  OperationResult(this.dataConnect, this.data, this.ref);
  Data data;
  OperationRef<Data, Variables> ref;
  FirebaseDataConnect dataConnect;
}

final result = await MoviesConnector.instance.deleteMovie(
  id: id,
);
DeleteMovieData data = result.data;
final ref = result.ref;
```

#### Getting the Ref
Each builder returns an `execute` function, which is a helper function that creates a `Ref` object, and executes the underlying operation.
An example of how to use the `Ref` object is shown below:
```dart
String id = ...;

final ref = MoviesConnector.instance.deleteMovie(
  id: id,
).ref();
ref.execute();
```

