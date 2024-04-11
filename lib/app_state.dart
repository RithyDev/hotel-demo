import 'package:get_it/get_it.dart';
import 'package:hotel_app/feature/auth/signup/otp/sign_up_otp_viewmodel.dart';
import 'package:hotel_app/feature/auth/signup/sign_up_viewmodel.dart';
import 'package:hotel_app/global_state.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> appChnageNotifierProviders() {
  final globalState = GetIt.I<GlobalState>();
  return [
    ChangeNotifierProvider(create: (context) => globalState),
    ..._signUpFlowProviders()
  ];
}

List<SingleChildWidget> _signUpFlowProviders() {
  return [
    ChangeNotifierProvider(create: (context) => SignUpViewModel.createNewInstance()),
    ChangeNotifierProvider(create: (context) => SignUpConfirmOtpViewModel.createNewInstance())
  ];
}