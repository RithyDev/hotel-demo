import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/feature/auth/signup/sign_up_viewmodel.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/remote/model/sign_init_info.dart';
import 'package:hotel_app/remote/service/exceptions.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:hotel_app/route/app_route.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/app_outlined_button.dart';
import 'package:hotel_app/widget/dialog_utils.dart';
import 'package:hotel_app/widget/input_field.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late SignUpViewModel viewModel;
  late VoidCallback notifyListeners;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<SignUpViewModel>(context, listen: false);
    viewModel.reset();
    notifyListeners = () {
      observedOnInitStateChange(viewModel.init);
    };

    viewModel.addListener(notifyListeners);
  }

  @override
  void dispose() {
    viewModel.removeListener(notifyListeners);
    super.dispose();
  }

  void observedOnInitStateChange(AsyncData<SignUpInitInfo>? state) async {
    if (state is Success) {
      viewModel.resetInitState();
      Navigator.of(context).pushNamed(RouteName.signUpOtpPage, arguments: {
        'ref': state?.data?.ref ?? '',
        'otp': state?.data?.otp,
        'emailOrPhone': viewModel.formData.emailOrPhone.value
      });
    } else if (state is Fail) {
      String errorMessage = 'Oop! something went wrong';
      var err = (state as Fail).throwable;
      if (err is IOExcepection) {
        errorMessage = err.errorMessage;
      }
      await showMessageDialog(context,
          title: 'Request failed', message: errorMessage);
      viewModel.resetInitState();
    }
  }

  @override
  Widget build(BuildContext context) {
    //All the logic and behavoir is controlled by viewModel
    SignUpViewModel viewModel = Provider.of<SignUpViewModel>(context);
    return _renderMainContent(context, viewModel);
  }

  Widget _renderMainContent(BuildContext context, SignUpViewModel viewModel) {
    return Scaffold(
      body: Stack(
        children: [
          _renderSignUpForm(context, viewModel),
          _renderBlockLoadingIfNeed(context, viewModel)
        ],
      ),
    );
  }

  Widget _renderBlockLoadingIfNeed(
      BuildContext context, SignUpViewModel viewModel) {
    var state = viewModel.init;
    return switch (state?.state) {
      AsyncState.loading => appBlockLoading('Loading...'),
      _ => const SizedBox()
    };
  }

  Widget _renderSignUpForm(BuildContext context, SignUpViewModel viewModel) {
    return SizedBox(
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
      _createAccountButton(context, viewModel),
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
          color: Colors.blue,
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

  Widget _createAccountButton(BuildContext context, SignUpViewModel viewModel) {
    return Container(
      key: ValueKey('${viewModel.isValidInputForm()}'),
      child: appRoundedButton(context,
          title: 'Create Account',
          onPressed:
              viewModel.isValidInputForm() ? () => viewModel.signUp() : null),
    ).animate().fade();
  }

  void onCreatePressed(BuildContext context) {
    // Navigator.of(context).pushNamed(RouteName.signUpOtpPage, arguments: {
    //   "username": "hello"
    // });
  }
}
