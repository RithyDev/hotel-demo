import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/feature/auth/signup/otp/sign_up_otp_viewmodel.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:provider/provider.dart';

class SignUpConfirmOtpPage extends StatelessWidget {
  const SignUpConfirmOtpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = SignUpConfirmOtpViewModel.createNewInstance();
    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: _renderMainContent(context, viewModel),
    );
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
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Column(
                children: [
                  _renderImageHeader(),
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
              _renderSubmitButton(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Didn't received the code?"),
                    Text(
                      'Resend',
                      style:
                          TextStyle(color: Theme.of(context).primaryColorDark),
                    ),
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
      padding: const EdgeInsets.symmetric(vertical: 32),
      child: LayoutBuilder(builder: (context, constraints) {
        final boxSize = (constraints.maxWidth / 5) - 8;
        return OtpTextField(
          numberOfFields: 5,
          showFieldAsBox: true,
          borderWidth: 1,
          textStyle: const TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
          enabledBorderColor: Colors.grey.withOpacity(0.2),
          borderRadius: BorderRadius.circular(12),
          fieldWidth: boxSize,
        );
      }),
    );
  }

  Widget _renderImageHeader() {
    return SizedBox(
        height: 120,
        width: 120,
        child: SvgPicture.asset(
          ImageSource.imgSignUpOtp,
          width: 120,
          height: 120,
        ));
  }

  Widget _renderSubmitButton() {
    return SizedBox(
      height: 50,
      child: TextButton(
        onPressed: () => {},
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
        ),
        child: const Text(
          'Submit',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
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
