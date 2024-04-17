import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class HotelOverview extends StatelessWidget {
  const HotelOverview({super.key});

  String get dummyText =>
      "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Donec quam felis, ultricies nec, pellentesque eu,";

  @override
  Widget build(BuildContext context) {
    var color = Theme.of(context).primaryColor;
    var htmlContent = '''
        <div style="padding: 0px, margin: -10px">
          <p>$dummyText <b><font color=${colorToHexString(color)}>See More</font></p>
        <div>
    ''';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Html(
            data: htmlContent,
          ),
        )
      ],
    );
  }

  String colorToHexString(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').substring(2).toUpperCase()}';
  }
}
