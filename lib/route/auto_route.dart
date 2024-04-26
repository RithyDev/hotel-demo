import 'package:auto_route/auto_route.dart';

import 'auto_route.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen,Route')
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(path: '/', page: SplashRoute.page, initial: true),
        AutoRoute(path: '/onboard', page: OnboardRoute.page),
        AutoRoute(path: '/signup', page: SignUpRoute.page),
        AutoRoute(path: '/signup-otp', page: SignUpOtpRoute.page),
        AutoRoute(path: '/signin', page: SignInRoute.page),
        AutoRoute(path: '/home', page: MainRoute.page),
        AutoRoute(path: '/hotel-info', page: HotelDetailRoute.page),
        
        AutoRoute(path: '/dashboard', page: HomeRoute.page, children: [
          AutoRoute(path: 'tab-home', page: TabHomeRoute.page),
          AutoRoute(path: 'booking', page: MyBookingPage.page),
          AutoRoute(path: 'other-page', page: TabRoute.page)
        ])
      ];
}
