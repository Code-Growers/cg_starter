import 'package:cg_starter/bloc/app_bloc/app_bloc.dart';
import 'package:cg_starter/bloc/app_bloc/app_event.dart';
import 'package:cg_starter/bloc/app_bloc/app_state.dart';
import 'package:cg_starter/bloc/simple_bloc_observer.dart';
import 'package:cg_starter/constants/routes.dart';
import 'package:cg_starter/theme/theme_data.dart';
import 'package:device_info/device_info.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' as services;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:flutter_i18n/loaders/namespace_file_translation_loader.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<bool> isIpad() async {
  try {
    final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    final IosDeviceInfo info = await deviceInfo.iosInfo;
    if (info.model.toLowerCase().contains('ipad')) {
      return true;
    }
    return false;
  } catch (_) {
    return false;
  }
}

Future<void> main() async {
  final FlutterI18nDelegate flutterI18nDelegate = FlutterI18nDelegate(
    translationLoader: NamespaceFileTranslationLoader(
      namespaces: <String>[
        'common',
      ],
      useCountryCode: false,
      fallbackDir: 'en',
      basePath: 'i18n',
      forcedLocale: Locale('en'),
    ),
    missingTranslationHandler: (String key, Locale locale) {
      print('--- Missing Key: $key, languageCode: ${locale.languageCode}');
    },
  );
  Bloc.observer = SimpleBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BlocProvider<AppBloc>(
    create: (BuildContext context) => AppBloc()..add(AppInitEvent()),
    child: DevicePreview(
      enabled: !kReleaseMode && await isIpad(),
      builder: (BuildContext context) => App(flutterI18nDelegate),
    ),
  ));
}

final GlobalKey<NavigatorState> appNavigatorKey = GlobalKey<NavigatorState>();

class App extends StatelessWidget {
  final FlutterI18nDelegate flutterI18nDelegate;

  App(this.flutterI18nDelegate);

  @override
  Widget build(BuildContext context) {
    if (kReleaseMode) {
      services.SystemChrome.setPreferredOrientations(
          <services.DeviceOrientation>[services.DeviceOrientation.portraitUp]);
    } else {
      services.SystemChrome
          .setPreferredOrientations(<services.DeviceOrientation>[
        services.DeviceOrientation.portraitUp,
        services.DeviceOrientation.landscapeLeft,
        services.DeviceOrientation.landscapeRight,
        services.DeviceOrientation.portraitDown,
      ]);
    }
    return ScreenUtilInit(
      designSize: Size(360, 640),
      allowFontScaling: true,
      child: MaterialApp(
        locale: DevicePreview.of(context).locale,
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          flutterI18nDelegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate
        ],
        builder: (BuildContext context, Widget child) {
          return BlocBuilder<AppBloc, AppState>(
            builder: (BuildContext context, AppState appState) {
              if (appState is AppInitializedState) {
                return DevicePreview.appBuilder(context, child);
              } else if (appState is AppUninitializedState) {
                return SizedBox.shrink();
              } else {
                return SizedBox.shrink();
              }
            },
          );
        },
        title: 'CodeGrowers',
        theme: mainTheme,
        initialRoute: describeEnum(Routes.home),
        navigatorKey: appNavigatorKey,
        routes: routes,
      ),
    );
  }
}
