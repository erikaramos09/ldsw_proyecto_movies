import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:ldsw_proyecto_movies/services/auth_provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _formKey = GlobalKey<FormState>();
  final auth = AuthProvider.instance;
  String _email = '';
  String _password = '';
  bool _isSignIn = true;
  String? _error;

  void _setError(String? error) {
    setState(() {
      _error = error;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      try {
        var op = _isSignIn ? auth.signIn : auth.signUp;
        op(_email, _password).catchError((err) => _setError(err.toString()));
      } catch (error) {
        _setError(error.toString());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          const Text('Iniciar sesión o registrarse'),
          Image.asset('assets/images/movie-icon.png'),
          TextFormField(
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese un email';
              }
              if (!EmailValidator.validate(value)) {
                return 'Por favor ingrese un email valido';
              }
              return null;
            },
            onChanged: (value) => _email = value,
            onSaved: (value) => _email = value!,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Contraseña'),
            obscureText: true,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Por favor ingrese una contraseña';
              }
              return null;
            },
            onSaved: (value) => _password = value!,
          ),
          if (_error != null)
            Text(_error!, style: TextStyle(color: Colors.red)),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: _submit,
            child: Text(_isSignIn ? 'Ingresar' : 'Registrarse'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                _isSignIn = !_isSignIn;
              });
            },
            child: Text(
              _isSignIn
                  ? 'Primera vez? Crea una cuenta (click aquí, cambia el texto del botón y así)'
                  : 'Ya tiene una cuenta? Ingresar (click aqui, cambia el texto del botón y asi)',
            ),
          ),
        ],
      ),
    );
  }
}
