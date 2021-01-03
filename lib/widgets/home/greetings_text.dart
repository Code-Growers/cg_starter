import 'package:flutter/cupertino.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:gap/gap.dart';
import 'package:cg_starter/extensions/extensions.dart';

class GreetingsText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(FlutterI18n.translate(context, 'common.greetings')),
          Gap(12.0.h),
          Text(FlutterI18n.translate(context, 'common.towards')),
        ],
      ),
    );
  }
}
