import 'dart:async';

import 'package:flutter/material.dart';

GlobalKey<NavigatorState> navigator = GlobalKey<NavigatorState>();

pushLazily(Widget page) {
  return navigator
      .pushLazily<Widget>(MaterialPageRoute(builder: (context) => page));
}

pushNamedLazily(String routeName, {Object? arguments}) {
  return navigator.pushNamedLazily<Widget>(routeName, arguments: arguments);
}

pushReplacementLazily(Route<Widget> route) {
  return navigator.pushReplacementLazily<Widget>(route);
}

pushReplacementNamedLazily(String routeName, {Object? arguments}) {
  return navigator.pushReplacementNamedLazily<Widget>(routeName,
      arguments: arguments);
}

pushAndRemoveUntilLazily(Route<Widget> route, RoutePredicate predicate) {
  return navigator.pushAndRemoveUntilLazily<Widget>(route, predicate);
}

pushNamedAndRemoveUntilLazily(String routeName, RoutePredicate predicate,
    {Object? arguments}) {
  return navigator.pushNamedAndRemoveUntilLazily<Widget>(routeName, predicate,
      arguments: arguments);
}

extension NavigatorExtension on GlobalKey<NavigatorState> {
  void pushLazily<T extends Object>(Route<T> route) {
    Timer(const Duration(microseconds: 0), () => currentState?.push(route));
  }

  void pushNamedLazily<T extends Object>(String routeName,
      {Object? arguments}) {
    Timer(const Duration(microseconds: 0),
        () => currentState?.pushNamed(routeName, arguments: arguments));
  }

  void pushReplacementLazily<T extends Object>(Route<T> route) {
    Timer(const Duration(microseconds: 0),
        () => currentState?.pushReplacement(route));
  }

  void pushReplacementNamedLazily<T extends Object>(String routeName,
      {Object? arguments}) {
    Timer(
        const Duration(microseconds: 0),
        () => currentState?.pushReplacementNamed(routeName,
            arguments: arguments));
  }

  void pushAndRemoveUntilLazily<T extends Object>(
      Route<T> route, RoutePredicate predicate) {
    Timer(const Duration(microseconds: 0),
        () => currentState?.pushAndRemoveUntil(route, predicate));
  }

  void pushNamedAndRemoveUntilLazily<T extends Object>(
      String routeName, RoutePredicate predicate,
      {Object? arguments}) {
    Timer(
        const Duration(microseconds: 0),
        () => currentState?.pushNamedAndRemoveUntil(
              routeName,
              predicate,
              arguments: arguments,
            ));
  }
}
