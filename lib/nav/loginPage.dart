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
      body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: 40.0,
              vertical:
                  MediaQuery.of(context).orientation == Orientation.portrait
                      ? 50.0
                      : MediaQuery.of(context).size.height * 0.1),
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "Login"),
                    autocorrect: true,
                  ),
                  TextField(
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  SizedBox(
                    height: 5.0,
                  ),
                  RaisedButton(
                    child: Text("LOGIN"),
                    elevation: 2.0,
                    onPressed: () {},
                  )
                ],
              ),
            ),
          )),
    );
  }
}
