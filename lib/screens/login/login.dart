import 'package:flutter/material.dart';
import 'package:flutter_firebase_chat/globals.dart' as globals;
import 'dart:math' as math;

/// Login Screen
class Login extends StatefulWidget {
  Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _userController = TextEditingController();

  // Triggered in submit or with the button.
  void _login() {
    if (_formKey.currentState.validate()) {
      globals.username = _userController.text;
      // Prevents going back
      Navigator.pushReplacementNamed(context, '/home')
          .then((value) => globals.username = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.center,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // MediaQuery to adjust the logo according to screen size and orientation
              Image.asset(
                'assets/logo.png',
                width: math.min(MediaQuery.of(context).size.width / 2,
                    MediaQuery.of(context).size.height / 2),
              ),
              SizedBox(height: 32),
              TextFormField(
                  decoration: InputDecoration(
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    isDense: true,
                    hintText: '¿Como quieres llamarte?',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      //borderSide: BorderSide(color: Colors.blue),
                    ),
                    suffixIcon:
                        TextButton(child: Text('Ingresar'), onPressed: _login),
                  ),
                  textCapitalization: TextCapitalization.words,
                  textInputAction: TextInputAction.go,
                  onFieldSubmitted: (_) => _login(),
                  controller: _userController,
                  validator: (value) =>
                      value.isEmpty ? 'Ingrese algun nombre de usuario' : null),
            ],
          ),
        ),
      ),
    );
  }
}
