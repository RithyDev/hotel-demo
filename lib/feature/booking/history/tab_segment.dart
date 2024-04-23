import 'package:flutter/material.dart';

class TabSegment extends StatefulWidget {
  
  const TabSegment({super.key});

  @override
  State<TabSegment> createState() => _TabSegmentState();
}

class _TabSegmentState extends State<TabSegment> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.06),
          borderRadius: BorderRadius.circular(55 / 2)),
      child: Stack(
        children: [
          Row(
            children: [
              _renderTabItem(0,
                  title: 'Booked', isSelected: _selectedIndex == 0),
              _renderTabItem(1,
                  title: 'History', isSelected: _selectedIndex == 1)
            ],
          ),
        ],
      ),
    );
  }

  Widget _renderTabItem(int index,
      {required String title, bool isSelected = false}) {
    return Expanded(child: _renderTabContainer(title, isSelected, index));
  }

  Widget _renderTabContainer(String title, bool isSelected, int tapIndex) {
    Color bgColor = isSelected ? Colors.white : Colors.white.withOpacity(0);
    FontWeight fontWeight = isSelected ? FontWeight.bold : FontWeight.w400;

    return Card(
      elevation: 0,
      clipBehavior: Clip.antiAlias,
      color: Colors.transparent,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        splashColor: Colors.blue.withOpacity(0.2),
        onTap: () {
          setState(() {
            _selectedIndex = tapIndex;
          });
        },
        child: AnimatedContainer(
            duration: const Duration(milliseconds: 240),
            color: bgColor,
            child: Center(child: _renderTitle(title, fontWeight))),
      ),
    );
  }

  Widget _renderTitle(String title, FontWeight fontWeight) {
    return Text(
      title,
      style: TextStyle(fontWeight: fontWeight),
    );
  }
}
