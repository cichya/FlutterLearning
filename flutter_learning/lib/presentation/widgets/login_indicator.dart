import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
