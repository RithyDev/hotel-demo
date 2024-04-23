import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hotel_app/core/observable.dart';
import 'package:hotel_app/feature/auth/login/login_viewmodel.dart';
import 'package:hotel_app/feature/home/home_page.dart';
import 'package:hotel_app/feature/home/main_page.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/resource/image_resource.dart';
import 'package:hotel_app/widget/animated_dynamic_content.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/app_outlined_button.dart';
import 'package:hotel_app/widget/input_field.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  BuildContext? currentContext;
  late VoidCallback viewModelListener;
  final viewModel = LoginViewModel.createNewInstance();

  late UniqueOnly<AsyncData<String?>> authStateHandler;

  @override
  void initState() {
    super.initState();
    //Prevent from viemodel invoke the same state, UniqueOnly will only invoke on different value of state
    authStateHandler = UniqueOnly(onValueChange: onAuthStateChange);
    viewModelListener = () {
      authStateHandler.setValue(viewModel.authState);
    };
    viewModel.addListener(viewModelListener);
  }

  void onAuthStateChange(AsyncData<String?>? state) {
    if (state == null) {
      return;
    }
    if (state is Success) {
      navigateToHomeAndResetRounte();
    } else if (state is Fail) {
      showMessageDialog(context,
          message: 'Invalid emial, phone number or password.',
          title: 'Login failed');
    }
  }

  void navigateToHomeAndResetRounte() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const MainPage()),
        (route) => false);
  }

  @override
  void dispose() {
    viewModel.removeListener(viewModelListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => viewModel, child: _renderPageConsumer(context));
  }

  Widget _renderPageConsumer(BuildContext context) {
    return Consumer<LoginViewModel>(
        builder: (context, viewModel, child) =>
            _renderPageContent(context, viewModel));
  }

  Widget _renderPageContent(BuildContext context, LoginViewModel viewModel) {
    return Stack(
      children: [
        _renderFormContent(context, viewModel),
        _renderBlockLoadingState(viewModel)
      ],
    );
  }

  Scaffold _renderFormContent(BuildContext context, LoginViewModel viewModel) {
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
                  _loginTitle(),
                  _pageSubtitle(),
                  ..._formWidgets(context, viewModel)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _renderBlockLoadingState(LoginViewModel viewModel) {
    final state = viewModel.authState;
    final child = switch (viewModel.authState?.state) {
      AsyncState.loading => Container(
          color: Colors.white.withOpacity(0.8),
          child: Center(
            child: Card(
              color: Colors.white,
              surfaceTintColor: Colors.white,
              elevation: 10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              shadowColor: Colors.blue.withOpacity(0.2),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircularProgressIndicator(strokeWidth: 1),
                    SizedBox(width: 16),
                    Text('Signing-in')
                  ],
                ),
              ),
            ),
          ),
        ),
      _ => const SizedBox()
    };
    return AppAnimatedDynamicContent(
      keyState: '$state',
      child: child,
    );
  }

  Widget _pageSubtitle() {
    return const Opacity(
        opacity: 0.6, child: Text('Please login with register account'));
  }

  Widget _loginTitle() {
    return const Text(
      'Login Account',
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    );
  }

  List<Widget> _formWidgets(BuildContext context, LoginViewModel viewModel) {
    return [
      const SizedBox(height: 34),
      AppInputField(
        placeholder: 'Email address',
        hint: 'Email*',
        onChanged: (value) => viewModel.handleOnEmailChange(value),
        errorMessage: viewModel.email.errorMessage,
        icon: const Icon(Icons.email_outlined),
        iconOnFocused: Icon(
          Icons.email_outlined,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      AppInputField(
        placeholder: '**** abc',
        hint: 'Password*',
        obscureText: true,
        errorMessage: viewModel.password.errorMessage,
        onChanged: (value) => viewModel.handleOnPasswordChange(value),
        icon: const Icon(Icons.lock_open_outlined),
        iconOnFocused: Icon(
          Icons.lock_open_outlined,
          color: Theme.of(context).primaryColorDark,
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          TextButton(onPressed: () => {}, child: const Text('Forget password?'))
        ],
      ),
      const SizedBox(height: 32),
      _signInButton(context, viewModel),
      ..._loginWithOtherMethod(context)
    ];
  }

  Widget _signInButton(BuildContext context, LoginViewModel viewModel) {
    bool buttonEnabled = viewModel.formData.isValid();
    return appRoundedButton(context,
        title: 'Sign In',
        onPressed: buttonEnabled ? () => viewModel.login() : null);
  }

  List<Widget> _loginWithOtherMethod(BuildContext context) {
    return [
      const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          'Or using other method',
          textAlign: TextAlign.center,
        ),
      ),
      AppOutlinedButton(
          title: 'Sign In with Google',
          icon: SvgPicture.asset(
            ImageSource.iconGoogleLogo,
            width: 24,
            height: 24,
          )),
      const SizedBox(height: 16),
      const AppOutlinedButton(
          title: 'Sign In with Facebook', icon: Icon(Icons.facebook, size: 32))
    ];
  }
}
