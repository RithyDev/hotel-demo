import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hotel_app/feature/home/home_page.dart';
import 'package:hotel_app/widget/app_button_styles.dart';

class SuccessOtpSignUpPage extends StatelessWidget {
  const SuccessOtpSignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _renderSuccessImage(),
          const SizedBox(height: 42),
          _renderSuccessText(),
          _renderDescription(),
          const SizedBox(height: 42),
          appRoundedButton(context,
              title: 'Go to Homepage', onPressed: () => goToHomePage(context))
        ],
      ),
    );
  }

  void goToHomePage(BuildContext context) {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const HomePage()),
        (route) => false);
  }

  Widget _renderSuccessText() {
    return Text(
      'Register Success',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
    ).animate().fade().slide();
  }

  Widget _renderDescription() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Opacity(
        opacity: 0.5,
        child: Text(
          'Contgratulation! your account already created. Please login to get amazing experience.',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 15),
        ),
      ),
    ).animate(delay: const Duration(milliseconds: 600)).fade().slide();
  }

  Widget _renderSuccessImage() {
    const double size = 140;
    const color = Color.fromARGB(255, 81, 207, 46);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: size,
          width: size,
          child: Stack(
            children: [
              _renderCircle(color.withOpacity(0.2), size),
              Positioned(
                top: 20,
                bottom: 20,
                left: 20,
                right: 20,
                child: _renderCircle(color, size),
              ),
              const Center(
                child: Icon(
                  Icons.check_circle,
                  color: Colors.white,
                  size: 42,
                ),
              )
            ],
          ),
        ),
      ],
    ).animate(delay: const Duration(milliseconds: 400)).scale();
  }

  Widget _renderCircle(Color color, double size) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(size / 2)),
    );
  }
}
