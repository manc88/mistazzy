import 'package:flutter/material.dart';
import 'package:mistazzy/nav/paginator.dart';
import 'package:mistazzy/utils/Strings.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Center(
        child: Column(
          children: <Widget>[
            AppBar(
              title: Text(Strings.drawerheader),
            ),
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              leading: Icon(
                Icons.portrait,
                size: 32.0,
              ),
              title: Text(
                Strings.login,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(Strings.loginDetails),
            ),
            Divider(),
            ListTile(
              onTap: () {
                Paginator.goToTopicsList(context);
              },
              leading: Icon(
                Icons.filter_list,
                size: 32.0,
              ),
              title: Text(
                Strings.topicFilter,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(Strings.topicFilterDetails),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.favorite_border,
                size: 32.0,
              ),
              title: Text(
                Strings.favorite,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(Strings.favoriteDetails),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.color_lens,
                size: 32.0,
              ),
              title: Text(
                Strings.personalization,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(Strings.personalizationDetails),
            ),
            Divider(),
            ListTile(
              onTap: () {},
              leading: Icon(
                Icons.settings,
                size: 32.0,
              ),
              title: Text(
                Strings.settings,
                style: TextStyle(fontSize: 18.0),
              ),
              subtitle: Text(Strings.settingsDetails),
            ),
          ],
        ),
      ),
    );
  }
}
