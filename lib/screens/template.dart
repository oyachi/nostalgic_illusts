import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'dart:io';
/* screens */
import 'home_screen.dart';
import 'post_screen.dart';
import 'plan_screen.dart';
/* models */
import '../models/post.dart';
/* helper */
import '../helper/image_picker.dart';

enum TabType { home, plan }
final tabTypeProvider = StateProvider<TabType>((ref) => TabType.home);
/*postがあったときのProvider*/
final postProvider = StateProvider<Post>((ref) => Post());

class Template extends HookWidget {
  const Template({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabType = useProvider(tabTypeProvider);
    final _screens = [
      HomeScreen(),
      PlanScreen()
    ];

    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: AppBar(
          title: Text('Nostalgic Illusts'),
        ),
        body: _screens[tabType.state.index],
        floatingActionButtonLocation:  FloatingActionButtonLocation.centerDocked,
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              final File? image = await getImageFromGallery();
              if (image != null) {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => PostScreen(image)),
                );
              }
            },
            backgroundColor: Colors.white,
            child: Icon(
                Icons.add,
                color: Colors.grey,
              ),
          ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: tabType.state.index,
          onTap: (int selectIndex) {
            tabType.state = TabType.values[selectIndex];
          },
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.grey,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: "Home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.next_plan),
                label: "Plan"
            ),
          ],
        ),
    );
  }
}