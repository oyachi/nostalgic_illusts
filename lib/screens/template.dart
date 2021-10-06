import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
/* screens */
import 'home_screen.dart';
import 'post_screen.dart';
import 'detail_screen.dart';

enum TabType { home, add }
final tabTypeProvider = StateProvider<TabType>((ref) => TabType.home);

class Template extends HookWidget {
  const Template({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tabType = useProvider(tabTypeProvider);
    final _screens = [
      HomeScreen(),
      PostScreen()
    ];

    return Scaffold(
        backgroundColor: Color(0xFFF5F6F9),
        appBar: AppBar(
          title: Text('Nostalgic Illusts'),
        ),
        body: _screens[tabType.state.index],
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
                label: "home",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_photo_alternate_rounded),
                label: "add"
            )
          ],
        ),
    );
  }
}