import 'package:auto_route/auto_route.dart';
import 'package:hotel_app/feature/auth/login/login_page.dart';
import 'package:hotel_app/feature/auth/signup/sign_up_page.dart';
import 'package:hotel_app/feature/onboard/onboard_page.dart';

part 'auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends _$AppRouter {
   @override
  List<AutoRoute> get routes => [
    AutoRoute(path: '/', page: OnboardRoute.page, initial: true),
    AutoRoute(path: '/signup',page: SignUpRoute.page),
    AutoRoute(path: '/signin', page: SignInRoute.page)
  ];
} 