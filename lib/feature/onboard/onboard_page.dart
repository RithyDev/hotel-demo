import 'package:flutter/material.dart';
import 'package:hotel_app/feature/onboard/onboard_page_info.dart';
import 'package:hotel_app/route/app_route.dart';

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
    return Padding(
      padding: const EdgeInsets.only(bottom: 200),
      child: Image.network(
        model.imageUrl,
        fit: BoxFit.cover,
        width: double.infinity,
        height: double.infinity,
      ),
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
          _renderPageIndicator(pagesInfo.length, currentPage),
          _createAccountButton(),
          _renderLoginButton()
        ],
      ),
    );
  }

  Padding _renderDescription(String model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Opacity(
        opacity: 0.8,
        child: Text(
          model,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 12),
        ),
      ),
    );
  }

  Widget _renderLoginButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      child: TextButton(
          onPressed: () => Navigator.pushNamed(context, RouteName.loginPage),
          child: const Text(
            'Already have an Account',
            style: TextStyle(color: Colors.blue),
          )),
    );
  }

  Widget _controllerTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 44),
      child: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _renderPageIndicator(int pageSize, int activedIndex) {
    List<Widget> indicators = [];

    for (int i = 1; i <= pageSize; i++) {
      double size = 8;
      final color =
          (activedIndex + 1) == i ? Colors.blue : Colors.blue.withOpacity(0.2);
      indicators.add(Padding(
        padding: const EdgeInsets.all(4.0),
        child: Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(size / 2)),
        ),
      ));
    }
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: indicators,
      ),
    );
  }

  Widget _createAccountButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 34),
      child: TextButton(
        onPressed: () => Navigator.pushNamed(context, RouteName.signUpPage),
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: const Padding(
          padding: EdgeInsets.all(6),
          child: Text(
            'Create Account',
            style: TextStyle(
                color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
          ),
        ),
        
      ),
    );
  }

  void handleOnClick() {
    Navigator.pushNamed(context, RouteName.homePage);
  }
}
