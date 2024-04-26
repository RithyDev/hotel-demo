import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/auth/signup/otp/otp_success_page.dart';
import 'package:hotel_app/feature/auth/signup/otp/sign_up_otp_viewmodel.dart';
import 'package:hotel_app/global_state.dart';
import 'package:hotel_app/model/async_data.dart';
import 'package:hotel_app/widget/app_button_styles.dart';
import 'package:hotel_app/widget/dialog_utils.dart';
import 'package:provider/provider.dart';

class SignUpConfirmOtpPage extends StatefulWidget {
  final String destination;
  final String ref;
  final String? otp;

  const SignUpConfirmOtpPage(
      {super.key, required this.destination, required this.ref, this.otp});

  @override
  State<SignUpConfirmOtpPage> createState() => _SignUpConfirmOtpPageState();
}

class _SignUpConfirmOtpPageState extends State<SignUpConfirmOtpPage> {
  late VoidCallback stateNotifyListener;
  late SignUpConfirmOtpViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = Provider.of<SignUpConfirmOtpViewModel>(context, listen: false);
    initialEvent(viewModel);
    viewModel.initialData(
        destination: widget.destination, ref: widget.ref, otp: widget.otp);
  }

  void initialEvent(SignUpConfirmOtpViewModel viewModel) {
    stateNotifyListener = () {
      observeOnOtpStateChange(viewModel.otpState);
    };
    viewModel.addListener(stateNotifyListener);
  }

  @override
  void dispose() {
    super.dispose();
    viewModel.removeListener(stateNotifyListener);
  }

  void observeOnOtpStateChange(AsyncData<String>? state) {
    if (state is Success) {
      showDialog(context);
    } else if (state is Fail) {
      showMessageDialog(context,
          title: 'Request failed', message: 'You have submit the incrrect OTP');
    }
  }

  void showDialog(BuildContext context) {
    showModalBottomSheet(
        context: context, builder: (context) => const SuccessOtpSignUpPage());
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SignUpConfirmOtpViewModel>(
        builder: (context, viewModel, child) =>
            _renderMainContent(context, viewModel));
  }

  Widget _shouldDisplayBlockLoading(BuildContext context) {
    return switch (viewModel.otpState?.state) {
      AsyncState.loading => appBlockLoading('Processing Otp'),
      _ => const SizedBox()
    };
  }

  Widget _renderMainContent(
      BuildContext context, SignUpConfirmOtpViewModel viewModel) {
    return Scaffold(
      body: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                ..._renderToolbar(context),
                _renderOtpForm(context, viewModel)
              ],
            ),
          ),
          _renderOtpMessage(),
          _shouldDisplayBlockLoading(context),
        ],
      ),
    );
  }

  Widget _renderOtpMessage() {
    return switch (viewModel.otp != null) {
      true => Positioned(bottom: 32, left: 0, right: 0, child: _toastOtpView()),
      _ => const SizedBox()
    }
        .animate(delay: const Duration(seconds: 1))
        .slide()
        .fadeIn()
        .fadeOut(delay: const Duration(seconds: 5));
  }

  Widget _toastOtpView() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 22),
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(20)),
            child: Text(
              'Your otp: ${viewModel.otp}',
              style: const TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            )),
      ],
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
                  _renderFormTitle(),
                  _renderSubtitle(),
                  Text(
                    viewModel.emailOrPhone ?? '',
                    style: const TextStyle(fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              _renderOtpView(context, viewModel),
              _renderSubmitButton(context),
              _renderResendOtpContent()
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderResendOtpContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Didn't received the code?"),
          TextButton(onPressed: () => {}, child: const Text('Resend')),
        ],
      ),
    );
  }

  Opacity _renderSubtitle() {
    return const Opacity(
      opacity: 0.5,
      child: Text('We have sent the code verification to'),
    );
  }

  Padding _renderFormTitle() {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Text(
        'Verification Code',
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
          onSubmit: (value) => viewModel.setOtpCode(value),
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
            const Text('Verification',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
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
