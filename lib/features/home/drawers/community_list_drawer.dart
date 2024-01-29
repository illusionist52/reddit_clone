import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/common/error_text.dart';
import 'package:reddit_clone/features/community/controller/community_controller.dart';
import 'package:reddit_clone/models/community_model.dart';
import 'package:routemaster/routemaster.dart';
import 'package:reddit_clone/core/common/loader.dart';

class CommunityListDrawer extends ConsumerWidget {
  const CommunityListDrawer({super.key});

  void navigateCreateCommunity(BuildContext context) {
    Routemaster.of(context).push('create_community');
  }

  void navigateToCommunity(BuildContext context, Community community) {
    Routemaster.of(context).push('/r/${community.name}');
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            ListTile(
              title: const Text('Create a community'),
              leading: const Icon(Icons.add),
              onTap: () => navigateCreateCommunity(context),
            ),
            ref.watch(userCommunitiesProvider).when(
                data: (communities) => Expanded(
                      child: ListView.builder(
                          itemCount: communities.length,
                          itemBuilder: (BuildContext context, int index) {
                            final community = communities[index];
                            return ListTile(
                              leading: CircleAvatar(
                                  backgroundImage:
                                      NetworkImage(community.avatar)),
                              title: Text('r/${community.name}'),
                              onTap: () {
                                navigateToCommunity(context, community);
                              },
                            );
                          }),
                    ),
                error: (error, stackTrace) =>
                    ErrorText(error: error.toString()),
                loading: () => const Loader())
          ],
        ),
      ),
    );
  }
}
