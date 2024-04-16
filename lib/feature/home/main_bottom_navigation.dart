import 'package:flutter/material.dart';

import 'package:flutter_animate/flutter_animate.dart';

class MainBottomNavigation extends StatefulWidget {
  final int? initialTabIndex;
  final Function(int index) onTabChange;
  const MainBottomNavigation(
      {super.key, this.initialTabIndex, required this.onTabChange});

  @override
  State<MainBottomNavigation> createState() => _MainBottomNavigationState();
}

class _MainBottomNavigationState extends State<MainBottomNavigation> {
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialTabIndex ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Divider(color: Colors.grey.withOpacity(0.1), height: 1),
        Row(
          children: [
            _renderItemMenu(0, title: 'Home', icon: Icons.home_outlined, selectedIcon: Icons.home_rounded),
            _renderItemMenu(1, title: 'Booking', icon: Icons.checklist_rounded),
            _renderItemMenu(2,
                title: 'Favorite',
                icon: Icons.favorite_outline_rounded,
                selectedIcon: Icons.favorite_rounded),
            _renderItemMenu(3,
                title: 'Profile', icon: Icons.person_outline_rounded, selectedIcon: Icons.person_rounded),
          ],
        ),
      ],
    );
  }

  Widget _renderItemMenu(int index,
      {required String title, required IconData icon, IconData? selectedIcon}) {
    bool isSelected = index == selectedIndex;
    Color color = isSelected ? Theme.of(context).primaryColor : Colors.black;
    int duration = isSelected ? 240 : 0;
    double scaleBeing = isSelected ? 1.2 : 1;
    IconData displayIcon = isSelected ? selectedIcon ?? icon : icon;

    return Expanded(
      child: Card(
        elevation: 0,
        color: Colors.transparent,
        child: _renderClickableMenu(
            index, displayIcon, color, duration, scaleBeing, title, isSelected),
      ),
    );
  }

  Widget _renderClickableMenu(int index, IconData displayIcon, Color color,
      int duration, double scaleBeing, String title, bool isSelected) {
    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        widget.onTabChange(index);
      },
      borderRadius: BorderRadius.circular(30),
      splashColor: Theme.of(context).primaryColor.withOpacity(0.1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _renderAnimatedIcon(
                displayIcon, color, index, duration, scaleBeing),
            _renderMenuTitle(title, color, isSelected)
          ],
        ),
      ),
    );
  }

  Widget _renderMenuTitle(String title, Color color, bool isSelected) {
    return Text(
      title,
      style: _titleTextStyle(color, isSelected),
    );
  }

  Animate _renderAnimatedIcon(IconData displayIcon, Color color, int index,
      int duration, double scaleBeing) {
    return Icon(
      displayIcon,
      color: color,
    ).animate(key: ValueKey<bool>(index == selectedIndex)).scale(
        duration: Duration(milliseconds: duration),
        begin: Offset(scaleBeing, scaleBeing),
        end: const Offset(1, 1));
  }

  TextStyle _titleTextStyle(Color color, bool isSelected) {
    return TextStyle(
        fontSize: 12,
        color: color,
        fontWeight: isSelected ? FontWeight.w700 : FontWeight.w400);
  }
}
