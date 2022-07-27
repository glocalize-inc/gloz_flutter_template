import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gloz_flutter_template/src/globals/navigator.dart';
import 'package:gloz_flutter_template/src/main/main_view.dart';

import '../firebase/init_firebase.dart';

class AppInitializationView extends StatelessWidget {
  static const String routeName = '/init';

  AppInitializationView({super.key}) {
    Future.wait([
      initializeFirebase(),
    ]).then((_) =>
        pushNamedAndRemoveUntilLazily(MainView.routeName, (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: Text('Hello world!')));
  }
}
