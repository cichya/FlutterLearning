import 'package:flutter/material.dart';
import 'package:flutter_learning/domain/blocs/login/login.dart';

class LoginPage extends StatefulWidget {
  final LoginBloc _loginBloc;

  LoginPage(this._loginBloc);

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final Map<String, dynamic> _formData = {'username': null, 'password': null};

  @override
  Widget build(BuildContext context) {
    _onLoginButtonPressed() {
      this.widget._loginBloc.dispatch(Login(
          userName: _formData['username'], password: _formData['password']));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'User name',
                      filled: true,
                      fillColor: Colors.white),
                  keyboardType: TextInputType.text,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter a your user name';
                    }
                  },
                  onSaved: (String value) {
                    _formData['username'] = value;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(
                      labelText: 'Password',
                      filled: true,
                      fillColor: Colors.white),
                  obscureText: true,
                  validator: (String value) {
                    if (value.isEmpty) {
                      return 'Please enter your password';
                    }
                  },
                  onSaved: (String value) {
                    _formData['password'] = value;
                  },
                ),
                RaisedButton(
                  child: Text('Login'),
                  onPressed: () => _onLoginButtonPressed(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
