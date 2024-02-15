import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:reddit_clone/core/constants/constants.dart';
import 'package:reddit_clone/features/auth/controller/auth_controller.dart';
import 'package:reddit_clone/features/home/delegates/search_commmunity_delegate.dart';
import 'package:reddit_clone/features/home/drawers/community_list_drawer.dart';
import 'package:reddit_clone/features/home/drawers/profile_drawer.dart';
import 'package:reddit_clone/theme/palette.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);


@override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();

}
  class _HomeScreenState extends ConsumerState<HomeScreen>{
    int _page = 0;


  void displayDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  void displayEndDrawer(BuildContext context) {
    Scaffold.of(context).openEndDrawer();
  }

  onPageChanged(int page){
    setState(() {
      _page=page;
    });
  }


  @override
  Widget build(BuildContext context) {
    final currentTheme = ref.watch(themeNotifierProvider);
    final user = ref.watch(userProvider)!;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: false,
        leading: Builder(builder: (context) {
          return IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () => displayDrawer(context),
          );
        }),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: SearchCommunityDelegate(ref: ref));
              },
              icon: const Icon(Icons.search)),
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                displayEndDrawer(context);
              },
              icon: CircleAvatar(
                backgroundImage: NetworkImage(user.profilePic),
              ),
            );
          })
        ],
      ),
      body: Constants.tabWidgets[_page],
      drawer: const CommunityListDrawer(),
      endDrawer: const ProfileDrawer(),
      bottomNavigationBar: CupertinoTabBar(
        activeColor: currentTheme.iconTheme.color ,
        backgroundColor: currentTheme.backgroundColor,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home)),
          BottomNavigationBarItem(icon: Icon(Icons.add))
        ],
        onTap: onPageChanged,
        currentIndex: _page,
      ),
    );
  }
  
  }
