// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:hotel_app/feature/auth/login/login_page.dart' as _i4;
import 'package:hotel_app/feature/auth/signup/otp/otp_success_page.dart' as _i5;
import 'package:hotel_app/feature/auth/signup/sign_up_page.dart' as _i6;
import 'package:hotel_app/feature/home/hotel/detail/hotel_page_detail.dart'
    as _i1;
import 'package:hotel_app/feature/home/hotel/model/hotel_model.dart' as _i10;
import 'package:hotel_app/feature/home/main_page.dart' as _i2;
import 'package:hotel_app/feature/onboard/onboard_page.dart' as _i3;
import 'package:hotel_app/splash_screen.dart' as _i7;

abstract class $AppRouter extends _i8.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    HotelDetailRoute.name: (routeData) {
      final args = routeData.argsAs<HotelDetailRouteArgs>(
          orElse: () => const HotelDetailRouteArgs());
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i1.HotelDetailScreen(
          key: args.key,
          model: args.model,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.MainScreen(),
      );
    },
    OnboardRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.OnboardScreen(),
      );
    },
    SignInRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInScreen(),
      );
    },
    SignUpOtpRoute.name: (routeData) {
      final args = routeData.argsAs<SignUpOtpRouteArgs>();
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.SignUpOtpScreen(
          key: args.key,
          destination: args.destination,
          ref: args.ref,
          otp: args.otp,
        ),
      );
    },
    SignUpRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.SignUpScreen(),
      );
    },
    SplashRoute.name: (routeData) {
      return _i8.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i7.SplashScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.HotelDetailScreen]
class HotelDetailRoute extends _i8.PageRouteInfo<HotelDetailRouteArgs> {
  HotelDetailRoute({
    _i9.Key? key,
    _i10.HotelModel? model,
    List<_i8.PageRouteInfo>? children,
  }) : super(
          HotelDetailRoute.name,
          args: HotelDetailRouteArgs(
            key: key,
            model: model,
          ),
          initialChildren: children,
        );

  static const String name = 'HotelDetailRoute';

  static const _i8.PageInfo<HotelDetailRouteArgs> page =
      _i8.PageInfo<HotelDetailRouteArgs>(name);
}

class HotelDetailRouteArgs {
  const HotelDetailRouteArgs({
    this.key,
    this.model,
  });

  final _i9.Key? key;

  final _i10.HotelModel? model;

  @override
  String toString() {
    return 'HotelDetailRouteArgs{key: $key, model: $model}';
  }
}

/// generated route for
/// [_i2.MainScreen]
class MainRoute extends _i8.PageRouteInfo<void> {
  const MainRoute({List<_i8.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i3.OnboardScreen]
class OnboardRoute extends _i8.PageRouteInfo<void> {
  const OnboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          OnboardRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignInScreen]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignInRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SignUpOtpScreen]
class SignUpOtpRoute extends _i8.PageRouteInfo<SignUpOtpRouteArgs> {
  SignUpOtpRoute({
    _i9.Key? key,
    required String destination,
    required String ref,
    String? otp,
    List<_i8.PageRouteInfo>? children,
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

  static const _i8.PageInfo<SignUpOtpRouteArgs> page =
      _i8.PageInfo<SignUpOtpRouteArgs>(name);
}

class SignUpOtpRouteArgs {
  const SignUpOtpRouteArgs({
    this.key,
    required this.destination,
    required this.ref,
    this.otp,
  });

  final _i9.Key? key;

  final String destination;

  final String ref;

  final String? otp;

  @override
  String toString() {
    return 'SignUpOtpRouteArgs{key: $key, destination: $destination, ref: $ref, otp: $otp}';
  }
}

/// generated route for
/// [_i6.SignUpScreen]
class SignUpRoute extends _i8.PageRouteInfo<void> {
  const SignUpRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SignUpRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignUpRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}

/// generated route for
/// [_i7.SplashScreen]
class SplashRoute extends _i8.PageRouteInfo<void> {
  const SplashRoute({List<_i8.PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const _i8.PageInfo<void> page = _i8.PageInfo<void>(name);
}
