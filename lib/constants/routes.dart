import 'package:cg_starter/screens/home_screen.dart';
import 'package:cg_starter/extensions/extensions.dart';
import 'package:flutter/material.dart';

final Map<String, Widget Function(BuildContext context)> routes =
    <String, Widget Function(BuildContext context)>{}
        .addRoute(Routes.home, HomeScreen());

enum Routes {
  home,
}
