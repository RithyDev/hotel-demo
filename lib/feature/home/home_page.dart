import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Icon(Icons.abc_outlined),
            Text('Home page'),
            Icon(Icons.abc_outlined)
          ],
        ),
      ),
    );
  }
}