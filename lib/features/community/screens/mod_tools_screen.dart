// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class ModsToolsScreen extends StatelessWidget {
  final String name;
  const ModsToolsScreen({
    Key? key,
    required this.name,
  }) : super(key: key);

  void navigateToEditCommunity(BuildContext context) {
    Routemaster.of(context).push('/edit-community/$name');
  }

  void navigateToAddModsCommunity(BuildContext context) {
    Routemaster.of(context).push('/add-mods/$name');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Mod Tools'),
      ),
      body: Column(children: [
        ListTile(
          leading: const Icon(Icons.add_moderator),
          title: const Text('Add moderators'),
          onTap: ()=> navigateToAddModsCommunity(context),
        ),
        ListTile(
          leading: const Icon(Icons.edit),
          title: const Text('Edit community'),
          onTap: () {
            navigateToEditCommunity(context);
          },
        )
      ]),
    );
  }
}
