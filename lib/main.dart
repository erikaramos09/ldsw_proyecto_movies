import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ldsw_proyecto_movies/graphql/generated/movies.dart';
import 'package:ldsw_proyecto_movies/screens/splash_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
  await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
  MoviesConnector.instance.dataConnect.useDataConnectEmulator(
    'localhost',
    9399,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Una app de movies',
      home: SplashScreen(),
    );
  }
}
