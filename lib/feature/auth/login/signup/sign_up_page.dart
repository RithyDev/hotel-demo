import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/feature/auth/login/signup/sign_up_viewmodel.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:hotel_app/widget/app_outlined_button.dart';
import 'package:hotel_app/widget/input_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    //All the logic and behavoir is controlled by viewModel
    final viewModel = SignUpViewModel.createNewInstance();

    return ChangeNotifierProvider(
      create: (context) => viewModel,
      child: Consumer<SignUpViewModel>(
        builder: (context, value, child) =>
            _renderMainContent(context, viewModel),
      ),
    );
  }

  Widget _renderMainContent(BuildContext context, SignUpViewModel viewModel) {
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ..._pageTitle(context),
                  ..._renderInputForm(context, viewModel)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> _pageTitle(BuildContext context) {
    return [
      const Text(
        'Create Account',
        style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
      ),
      const Opacity(
          opacity: 0.6, child: Text('Start learning with create your account'))
    ];
  }

  List<Widget> _renderInputForm(
      BuildContext context, SignUpViewModel viewModel) {
    final iconColor = Theme.of(context).primaryColorDark;
    return [
      const SizedBox(height: 16),
      _inputUsername(viewModel, iconColor),
      const SizedBox(height: 16),
      _inputEmailOrPhoneNumber(iconColor, viewModel),
      const SizedBox(height: 16),
      _inputPassword(viewModel, iconColor),
      const SizedBox(height: 24),
      _createAccountButton(viewModel),
      const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Or using other method',
          textAlign: TextAlign.center,
        ),
      ),
      _signUpWithGoogleButton(),
      const SizedBox(height: 8),
      _signUpWithFacebookButton()
    ];
  }

  AppInputField _inputPassword(SignUpViewModel viewModel, Color iconColor) {
    return AppInputField(
      hint: 'Password*',
      placeholder: '**** abc',
      onChanged: (value) => viewModel.setPassword(value),
      errorMessage: viewModel.formData.password.errorMessage,
      obscureText: true,
      icon: const Icon(Icons.lock_open_outlined),
      iconOnFocused: Icon(Icons.lock_open_outlined, color: iconColor),
    );
  }

  Widget _inputEmailOrPhoneNumber(Color iconColor, SignUpViewModel viewModel) {
    return AppInputField(
      hint: 'Email or Phone Number*',
      placeholder: 'user@domin.com',
      onChanged: (value) => viewModel.setEmailOrPhone(value),
      errorMessage: viewModel.formData.emailOrPhone.errorMessage,
      icon: const Icon(Icons.email_outlined),
      iconOnFocused: Icon(
        Icons.email_outlined,
        color: iconColor,
      ),
    );
  }

  Widget _inputUsername(SignUpViewModel viewModel, Color iconColor) {
    return AppInputField(
      hint: 'Username*',
      placeholder: 'Alex@123',
      onChanged: (value) => viewModel.setUsername(value),
      errorMessage: viewModel.formData.username.errorMessage,
      icon: const Icon(Icons.person_outline),
      iconOnFocused: Icon(Icons.person_outline, color: iconColor),
    );
  }

  Widget _signUpWithFacebookButton() {
    return const AppOutlinedButton(
        title: 'Sign Up with Facebook',
        icon: Icon(
          Icons.facebook,
          size: 30,
        ));
  }

  Widget _signUpWithGoogleButton() {
    return AppOutlinedButton(
        title: 'Sign Up with Google',
        icon: SvgPicture.asset(
          ImageSource.iconGoogleLogo,
          width: 24,
          height: 24,
        ));
  }

  Widget _createAccountButton(SignUpViewModel viewModel) {
    return TextButton(
        onPressed:
            viewModel.isValidInputForm() ? () => viewModel.signUp() : null,
        style: TextButton.styleFrom(
          backgroundColor: Colors.blue,
          disabledBackgroundColor: Colors.blue.withOpacity(0.4),
          padding: const EdgeInsets.all(16),
        ),
        child: const Text(
          'Create Account',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ));
  }
}
