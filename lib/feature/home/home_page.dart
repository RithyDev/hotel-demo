import 'package:flutter/material.dart';
import 'package:hotel_app/feature/home/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
  
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
      child: _renderPageContent(context),
    );
  }

  Widget _renderPageContent(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeViewModel>(
        builder: (context, viewModel, child) => _renderOnModelStateChange(context, viewModel),
      ),
    );
  }

  Widget _renderOnModelStateChange(BuildContext context, HomeViewModel viewModel) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Count ${viewModel.count}'),
            TextButton(onPressed: () => viewModel.increase(), child: const Text('Increase'))
          ],
        ),
      ),
    );
  }
}