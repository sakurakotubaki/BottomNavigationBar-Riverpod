import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_bottom_navigation/provider/provider.dart';
import 'package:riverpod_bottom_navigation/screens/home_screen.dart';
import 'package:riverpod_bottom_navigation/screens/map_screen.dart';
import 'package:riverpod_bottom_navigation/screens/profile_screen.dart';

void main() {
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ThemeDataでAppBar全体の色を統一する!
      theme: ThemeData(
        // 16進数の色を使うときは、Color(0xffの後に16進数の色を使用する)
        appBarTheme: const AppBarTheme(color: Color(0xff62abf5)),
      ),
      title: 'app',
      home: ScreenContainer(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ScreenContainer extends ConsumerWidget {
  const ScreenContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watchで変数の状態の変化を監視する。
    final tabType = ref.watch(tabTypeProvider.state);
    // List型で画面遷移先のページを定義する。
    List<Widget> _screens = [
      HomeScreen(),
      MapScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      body: _screens[tabType.state.index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: tabType.state.index,
        onTap: (int selectIndex) {
          tabType.state = TabType.values[selectIndex];
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.map),
            label: 'map',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
        ],
      ),
    );
  }
}
