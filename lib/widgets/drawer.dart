import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Menu"),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, '/login');
            },
            leading: Icon(Icons.portrait),
            title: Text("Login"),
            subtitle: Text("exerimental"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.chat_bubble_outline),
            title: Text("Chats"),
            subtitle: Text("Sorting, Favorits etc"),
          ),
          ListTile(
            onTap: () {},
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            subtitle: Text("Visual, Network & others"),
          )
        ],
      ),
    );
  }
}
