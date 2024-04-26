// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;
import 'package:hotel_app/feature/auth/login/login_page.dart' as _i6;
import 'package:hotel_app/feature/auth/signup/otp/otp_success_page.dart' as _i7;
import 'package:hotel_app/feature/auth/signup/sign_up_page.dart' as _i8;
import 'package:hotel_app/feature/booking/history/my_booking_page.dart' as _i4;
import 'package:hotel_app/feature/home/home_page.dart' as _i10;
import 'package:hotel_app/feature/home/home_screen.dart' as _i1;
import 'package:hotel_app/feature/home/hotel/detail/hotel_page_detail.dart'
    as _i2;
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart' as _i13;
import 'package:hotel_app/feature/home/main_page.dart' as _i3;
import 'package:hotel_app/feature/onboard/onboard_page.dart' as _i5;
import 'package:hotel_app/splash_screen.dart' as _i9;

abstract class $AppRouter extends _i11.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeScreen(),
      );
    },
    HotelDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HotelDetailRouteArgs>(
          orElse: () => const HotelDetailRouteArgs());
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.HotelDetailScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.MainScreen(),
      );
    },
    MyBookingPage.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.MyBookingPage(),
      );
    },
    OnboardRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.OnboardScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignInScreen(),
      );
    },
    SignUpOtpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpOtpRouteArgs>();
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.SignUpOtpScreen(
          key: args.key,
          destination: args.destination,
          ref: args.ref,
          otp: args.otp,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i8.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.SplashScreen(),
      );
    },
    TabHomeRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i10.TabHomeScreen(),
      );
    },
    TabRoute.name: (routeData) {
      return _i11.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.TabScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeScreen]
class HomeRoute extends _i11.PageRouteInfo<void> {
  const HomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HotelDetailScreen]
class HotelDetailRoute extends _i11.PageRouteInfo<HotelDetailRouteArgs> {
  HotelDetailRoute({
    _i12.Key? key,
    _i13.HotelModel? model,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          HotelDetailRoute.name,
          args: HotelDetailRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'HotelDetailRoute';

  static const _i11.PageInfo<HotelDetailRouteArgs> page =
      _i11.PageInfo<HotelDetailRouteArgs>(name);
}

class HotelDetailRouteArgs {
  const HotelDetailRouteArgs({
    this.key,
    this.model,
  });

  final _i12.Key? key;

  final _i13.HotelModel? model;

  @override
  String toString() {
    return 'HotelDetailRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i3.MainScreen]
class MainRoute extends _i11.PageRouteInfo<void> {
  const MainRoute({List<_i11.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i4.MyBookingPage]
class MyBookingPage extends _i11.PageRouteInfo<void> {
  const MyBookingPage({List<_i11.PageRouteInfo>? children})
      : super(
          MyBookingPage.name,
          initialChildren: children,
        );

  static const String name = 'MyBookingPage';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i5.OnboardScreen]
class OnboardRoute extends _i11.PageRouteInfo<void> {
  const OnboardRoute({List<_i11.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i6.SignInScreen]
class SignInRoute extends _i11.PageRouteInfo<void> {
  const SignInRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SignUpOtpScreen]
class SignUpOtpRoute extends _i11.PageRouteInfo<SignUpOtpRouteArgs> {
  SignUpOtpRoute({
    _i12.Key? key,
    required String destination,
    required String ref,
    String? otp,
    List<_i11.PageRouteInfo>? children,
  }) : super(
          SignUpOtpRoute.name,
          args: SignUpOtpRouteArgs(
            key: key,
            destination: destination,
            ref: ref,
            otp: otp,
          ),
          initialChildren: children,
        );

  static const String name = 'SignUpOtpRoute';

  static const _i11.PageInfo<SignUpOtpRouteArgs> page =
      _i11.PageInfo<SignUpOtpRouteArgs>(name);
}

class SignUpOtpRouteArgs {
  const SignUpOtpRouteArgs({
    this.key,
    required this.destination,
    required this.ref,
    this.otp,
  });

  final _i12.Key? key;

  final String destination;

  final String ref;

  final String? otp;

  @override
  String toString() {
    return 'SignUpOtpRouteArgs{key: $key, destination: $destination, ref: $ref, otp: $otp}';
  }
}

/// generated route for
/// [_i8.SignUpScreen]
class SignUpRoute extends _i11.PageRouteInfo<void> {
  const SignUpRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i9.SplashScreen]
class SplashRoute extends _i11.PageRouteInfo<void> {
  const SplashRoute({List<_i11.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i10.TabHomeScreen]
class TabHomeRoute extends _i11.PageRouteInfo<void> {
  const TabHomeRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TabHomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabHomeRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}

/// generated route for
/// [_i1.TabScreen]
class TabRoute extends _i11.PageRouteInfo<void> {
  const TabRoute({List<_i11.PageRouteInfo>? children})
      : super(
          TabRoute.name,
          initialChildren: children,
        );

  static const String name = 'TabRoute';

  static const _i11.PageInfo<void> page = _i11.PageInfo<void>(name);
}
