import 'package:flutter/material.dart';
import 'package:moc_2024_3/home/home_tab.dart';
import 'package:moc_2024_3/home/settings_tab.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  final _tabs = const [
    HomeTab(),
    SettingsTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('coucou'),
        leading: const Icon(Icons.airplane_ticket),
        actions: const [
          Icon(Icons.search),
          Icon(Icons.settings),
        ],
      ),
      body: _tabs[_currentIndex],
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => _changeTab(0),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: _onBottomBarTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'settings',
          ),
        ],
      ),
    );
  }

  void _onBottomBarTap(int index) {
    _changeTab(index);
    print('New index tapped: $_currentIndex');
  }

  void _changeTab(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
}
