import 'package:flutter/material.dart';
import 'lista_movies.dart';
import 'auth_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ldsw_proyecto_movies/services/auth_provider.dart' as ap;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Una aplicación de movies',
          style: TextStyle(fontSize: 28),
        ),
        actions: [
          StreamBuilder<User?>(
            stream: ap.AuthProvider.instance.authStateChanges,
            builder: (context, snapshot) {
              return Visibility(
                visible: snapshot.hasData,
                child: IconButton(
                  icon: const Icon(Icons.logout),
                  onPressed: () async {
                    if (!snapshot.hasData) return;
                    await ap.AuthProvider.instance.signOut();
                  },
                ),
              );
            },
          ),
        ],
        centerTitle: true,
      ),
      body: Center(child: _HomeScreenStatefulContent()),
    );
  }
}

class _HomeScreenStatefulContent extends StatefulWidget {
  @override
  _HomeScreenStatefulContentState createState() =>
      _HomeScreenStatefulContentState();
}

class _HomeScreenStatefulContentState
    extends State<_HomeScreenStatefulContent> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: ap.AuthProvider.instance.authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListaMovies();
        } else {
          return AuthScreen();
        }
      },
    );
  }
}
