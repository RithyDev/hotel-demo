import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/onboard/onboard_page_info.dart';
import 'package:hotel_app/widget/app_button_styles.dart';

class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  int currentPage = 0;
  List<OnboardPageInfo> pagesInfo = getPagesInfo();

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: pageSlider(context));
  }

  Widget pageSlider(BuildContext context) {
    return Stack(
      children: [
        PageView(
          onPageChanged: (page) => setState(() {
            currentPage = page;
          }),
          children: pagesInfo
              .map((info) => _renderPage(context, Colors.red, info))
              .toList(),
        ),
        _renderPageController(context)
      ],
    );
  }

  Widget _renderPage(BuildContext context, Color color, OnboardPageInfo model) {
    return Container(
      padding: const EdgeInsets.only(bottom: 200),
      child: Image.asset(model.imageCover, fit: BoxFit.cover),
    );
  }

  Widget _renderPageController(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: 0,
      child: _pageController(context),
    );
  }

  Widget _pageController(BuildContext context) {
    const radius = Radius.circular(20);
    final pageInfo = pagesInfo[currentPage];

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topRight: radius, topLeft: radius)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _controllerTitle(pageInfo.title),
          _renderDescription(pageInfo.description),
          _renderPageIndicator(context,pagesInfo.length, currentPage),
          _createAccountButton(),
          _renderLoginButton()
        ],
      ),
    );
  }

  Padding _renderDescription(String model) {
    return Padding(
      key: ValueKey(model),
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Opacity(
        opacity: 0.8,
        child: Text(
          model,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ).animate().fade().slide(),
    );
  }

  Widget _renderLoginButton() {
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: TextButton(
          onPressed: () =>_signInClick(),
          child: Text(
            'Already have an Account',
            style: TextStyle(color: Theme.of(context).primaryColor),
          )),
    );
  }

  Widget _controllerTitle(String title) {
    return Padding(
      key: ValueKey(title),
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ).animate().fade(duration: const Duration(milliseconds: 1500)),
    );
  }

  Widget _renderPageIndicator(BuildContext context,int pageSize, int activedIndex) {
    List<Widget> indicators = [];
    final themeData = Theme.of(context);
    for (int i = 1; i <= pageSize; i++) {
      double size = 8;
      final isSelected = (activedIndex + 1) == i;
      final color =
          isSelected ? themeData.primaryColor : themeData.primaryColor.withOpacity(0.2);
      
      var padding = Padding(
        key: ValueKey('$i$isSelected'),
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(size / 2)),
        ),
      ).animate().fade();
      indicators.add(padding);
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        key: const ValueKey('indicator-row'),
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators,
      ),
    );
  }

  Widget _createAccountButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: appRoundedButton(context, title: 'Create Account', onPressed: () => navigateToSignUp()),
    );
  }

  void navigateToSignUp() {
    context.router.pushNamed('/signup');   
  }

  void _signInClick() {
    context.router.pushNamed('/signin');
  }
}


@RoutePage()
class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardPage();
  }
}