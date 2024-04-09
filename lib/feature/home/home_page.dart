import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/home/home_viewmodel.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/repository/user_repo.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final UserRepository userRepo = GetIt.I<UserRepository>();
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel(userRepo: userRepo),
      child: _renderPageConsumer(context),
    );
  }

  Widget _renderPageConsumer(BuildContext context) {
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
            TextButton(onPressed: () => viewModel.increase(), child: const Text('Increase')),
            _renderOnTokenStateChange(viewModel.token)
          ],
        ),
      ),
    );
  }

  Widget _renderOnTokenStateChange(AsyncData<String>? state) {
    return switch(state?.state) {
      AsyncState.loading => const CircularProgressIndicator(),
      AsyncState.success => Text(state?.data ?? ''),
      _ => const SizedBox()
    };
  }
}