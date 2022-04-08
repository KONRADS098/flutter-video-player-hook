// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;
import 'package:video_player_hook/widgets/main.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.HomePage());
    },
    Route1.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Page1());
    },
    Route2.name: (routeData) {
      return _i2.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.Page2());
    }
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(HomeRoute.name, path: '/'),
        _i2.RouteConfig(Route1.name, path: '/Page1'),
        _i2.RouteConfig(Route2.name, path: '/Page2')
      ];
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i2.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i1.Page1]
class Route1 extends _i2.PageRouteInfo<void> {
  const Route1() : super(Route1.name, path: '/Page1');

  static const String name = 'Route1';
}

/// generated route for
/// [_i1.Page2]
class Route2 extends _i2.PageRouteInfo<void> {
  const Route2() : super(Route2.name, path: '/Page2');

  static const String name = 'Route2';
}
