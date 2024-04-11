import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/auth/signup/otp/sign_up_otp_viewmodel.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:provider/provider.dart';

class SignUpConfirmOtpPage extends StatelessWidget {
  const SignUpConfirmOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final SignUpConfirmOtpViewModel viewModel = Provider.of(context);
    return _renderMainContent(context, viewModel);
  }

  Widget _renderMainContent(
      BuildContext context, SignUpConfirmOtpViewModel viewModel) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ..._renderToolbar(context),
            _renderOtpForm(context, viewModel)
          ],
        ),
      ),
    );
  }

  Widget _renderOtpForm(
      BuildContext context, SignUpConfirmOtpViewModel viewModel) {
    return Expanded(
      child: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  _renderImageHeader(context),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      'Verification Code',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text('We have sent the code verification to'),
                  ),
                  Text(
                    'email@domain.com',
                    style: TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              _renderOtpView(context, viewModel),
              _renderSubmitButton(context),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't received the code?"),
                    TextButton(onPressed: () => {}, child: Text('Resend')),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderOtpView(
      BuildContext context, SignUpConfirmOtpViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 42, horizontal: 8),
      child: LayoutBuilder(builder: (context, constraints) {
        final boxSize = (constraints.maxWidth / 5) - 8;
        return OtpTextField(
          numberOfFields: 5,
          clearText: true,
          showFieldAsBox: true,
          borderWidth: 1,
          onCodeChanged: (value) => {},
          focusedBorderColor: Theme.of(context).primaryColor,
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          enabledBorderColor: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(16),
          fieldWidth: boxSize,
        );
      }),
    );
  }

  Widget _renderImageHeader(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    const double size = 140;
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        children: [
          _renderCircle(color.withOpacity(0.2), size),
          Positioned(
              top: 20,
              bottom: 20,
              left: 20,
              right: 20,
              child: _renderCircle(color, size)),
          const Center(
            child: Icon(
              Icons.email,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Widget _renderCircle(Color color, double size) {
    return Container(
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(size / 2)),
    );
  }

  Widget _renderSubmitButton(BuildContext context) {
    final globalState = GetIt.I<GlobalState>();
    return appRoundedButton(context,
        title: 'Submit',
        onPressed: () => globalState.changePrimaryColor(Colors.red));
  }

  List<Widget> _renderToolbar(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () => performOnBackPress(context),
                child: const Icon(Icons.arrow_back)),
            const Text('Verification'),
            const SizedBox(width: 24)
          ],
        ),
      ),
      Divider(height: 1, color: Colors.grey.withOpacity(0.3))
    ];
  }

  void performOnBackPress(BuildContext context) {
    Navigator.of(context).pop();
  }
}
