import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/route/auto_route.gr.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();
    runDelay();
  }

  void runDelay() {
    Future.delayed(const Duration(seconds: 2)).then((value) => navigateNext());
  }

  void navigateNext() {
    context.router.pushAndPopUntil(const HomeRoute(), predicate: (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _renderMainContent(context),
      ),
    );
  }

  Widget _renderMainContent(BuildContext context) {
    return Stack(
      children: [_renderAppTitlte(context), _renderAppVersion()],
    );
  }

  Widget _renderAppTitlte(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _renderTitle(context),
          _renderSubtitle(),
          const SizedBox(height: 80)
        ],
      ).animate().fade().slide(),
    );
  }

  Widget _renderAppVersion() {
    return Positioned(
      bottom: 12,
      left: 16,
      right: 16,
      child: const Text(
        'Version 1.0.0',
        textAlign: TextAlign.center,
      ).animate(delay: const Duration(milliseconds: 400)).fade(),
    );
  }

  Widget _renderSubtitle() {
    return const Opacity(
        opacity: 0.6,
        child: Text(
          'Very easy to book a hotel',
          style: TextStyle(fontWeight: FontWeight.w600),
        ));
  }

  Widget _renderTitle(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Hotel',
          style: titleStyle,
        ),
        Text(
          'demo',
          style: titleStyle.copyWith(color: Theme.of(context).primaryColor),
        )
      ],
    );
  }

  TextStyle get titleStyle =>
      const TextStyle(fontSize: 24, fontWeight: FontWeight.bold);
}

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SplashScreenPage();
  }
}
