import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  Stream<User?> get authStateChanges => _auth.authStateChanges();
  static final instance = AuthProvider._();
  AuthProvider._();

  Future<void> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message ?? '');
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message ?? '');
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseAuthException catch (e) {
      throw AuthException(e.code, e.message ?? '');
    }
  }
}

class AuthException implements Exception {
  final String code;
  final String message;

  AuthException(this.code, this.message);

  @override
  String toString() {
    return 'AuthException: $code - $message';
  }
}
