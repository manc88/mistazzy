import 'package:flutter/material.dart';
import 'package:mistazzy/widgets/drawer.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      drawer: AppDrawer(),
      body: Center(
          child: Column(
        children: <Widget>[Text("Login")],
      )),
    );
  }
}
