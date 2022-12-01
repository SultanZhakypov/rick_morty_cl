// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:flutter/material.dart' as _i6;

import '../feature/detail/presentation/pages/detail_screen/detail_screen.dart'
    as _i1;
import '../feature/home/domain/entities/person_entity.dart' as _i7;
import '../feature/home/presentation/pages/main_screen/main_screen.dart' as _i4;
import '../feature/home/presentation/widgets/custom_search.dart' as _i2;
import '../feature/settings/presentation/pages/settings_screen/settings_screen.dart' as _i3;

class AppRouter extends _i5.RootStackRouter {
  AppRouter([_i6.GlobalKey<_i6.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    DetailScreenRoute.name: (routeData) {
      final args = routeData.argsAs<DetailScreenRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i1.DetailScreen(
          key: args.key,
          person: args.person,
        ),
      );
    },
    CustomSearchScreenRoute.name: (routeData) {
      final args = routeData.argsAs<CustomSearchScreenRouteArgs>();
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i2.CustomSearchScreen(
          key: args.key,
          value2: args.value2,
        ),
      );
    },
    SettingsScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.SettingsScreen(),
      );
    },
    MainScreenRoute.name: (routeData) {
      return _i5.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.MainScreen(),
      );
    },
  };

  @override
  List<_i5.RouteConfig> get routes => [
        _i5.RouteConfig(
          DetailScreenRoute.name,
          path: '/detail',
        ),
        _i5.RouteConfig(
          CustomSearchScreenRoute.name,
          path: '/search',
        ),
        _i5.RouteConfig(
          SettingsScreenRoute.name,
          path: '/settings',
        ),
        _i5.RouteConfig(
          MainScreenRoute.name,
          path: '/',
        ),
      ];
}

/// generated route for
/// [_i1.DetailScreen]
class DetailScreenRoute extends _i5.PageRouteInfo<DetailScreenRouteArgs> {
  DetailScreenRoute({
    _i6.Key? key,
    required _i7.PersonEntity person,
  }) : super(
          DetailScreenRoute.name,
          path: '/detail',
          args: DetailScreenRouteArgs(
            key: key,
            person: person,
          ),
        );

  static const String name = 'DetailScreenRoute';
}

class DetailScreenRouteArgs {
  const DetailScreenRouteArgs({
    this.key,
    required this.person,
  });

  final _i6.Key? key;

  final _i7.PersonEntity person;

  @override
  String toString() {
    return 'DetailScreenRouteArgs{key: $key, person: $person}';
  }
}

/// generated route for
/// [_i2.CustomSearchScreen]
class CustomSearchScreenRoute
    extends _i5.PageRouteInfo<CustomSearchScreenRouteArgs> {
  CustomSearchScreenRoute({
    _i6.Key? key,
    required String value2,
  }) : super(
          CustomSearchScreenRoute.name,
          path: '/search',
          args: CustomSearchScreenRouteArgs(
            key: key,
            value2: value2,
          ),
        );

  static const String name = 'CustomSearchScreenRoute';
}

class CustomSearchScreenRouteArgs {
  const CustomSearchScreenRouteArgs({
    this.key,
    required this.value2,
  });

  final _i6.Key? key;

  final String value2;

  @override
  String toString() {
    return 'CustomSearchScreenRouteArgs{key: $key, value2: $value2}';
  }
}

/// generated route for
/// [_i3.SettingsScreen]
class SettingsScreenRoute extends _i5.PageRouteInfo<void> {
  const SettingsScreenRoute()
      : super(
          SettingsScreenRoute.name,
          path: '/settings',
        );

  static const String name = 'SettingsScreenRoute';
}

/// generated route for
/// [_i4.MainScreen]
class MainScreenRoute extends _i5.PageRouteInfo<void> {
  const MainScreenRoute()
      : super(
          MainScreenRoute.name,
          path: '/',
        );

  static const String name = 'MainScreenRoute';
}
