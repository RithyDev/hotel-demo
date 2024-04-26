import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotel_app/feature/booking/history/my_booking_page.dart';
import 'package:hotel_app/feature/home/home_page.dart';
import 'package:hotel_app/feature/home/main_bottom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedTap = 0;
  final _pages = [
    const HomePage(),
    const MyBookingPage(),
    const Scaffold(backgroundColor: Colors.blue),
    const Scaffold(backgroundColor: Colors.yellow)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [_renderMainContent(context), _renderBottomNavigation()],
      ),
    );
  }

  Widget _renderBottomNavigation() {
    return SafeArea(
        top: false,
        child: MainBottomNavigation(
          initialTabIndex: selectedTap,
          onTabChange: (index) {
            setState(() {
              selectedTap = index;
            });
          },
        ));
  }

  Widget _renderMainContent(BuildContext context) {
    return Expanded(child: IndexedStack(index: selectedTap, children: _pages));
  }
}


@RoutePage()
class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainPage();
  }
}