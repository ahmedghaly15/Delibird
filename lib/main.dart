import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:nexo_app/core/global/app_theme.dart';
import 'package:nexo_app/features/splash/presentation/views/splash_view.dart';

import 'core/network/cache_helper.dart';
import 'core/utils/size_config.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setSystemUIOverlayStyle();

  await CacheHelper.initSharedPref();

  runApp(const NexoApp());
}

class NexoApp extends StatelessWidget {
  const NexoApp({Key? key}) : super(key: key);

  // TODO: remember to look at Responsive Class on Zahraa's GitHub

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nexo-App',
      theme: AppTheme.appTheme(),
      home: const SplashView(),
    );
  }
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
    ),
  );
}
