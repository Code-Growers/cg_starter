import 'package:cg_starter/screens/home_screen.dart';
import 'package:cg_starter/utils/screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

final Map<String, Widget Function(BuildContext context)> routes =
    <String, Widget Function(BuildContext context)>{
  describeEnum(Routes.home): (BuildContext context) =>
      withScreenUtil(context, HomeScreen()),
};

enum Routes {
  home,
}
