import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/global/app_theme.dart';
import 'core/network/local/cache_helper.dart';
import 'core/utils/firebase_options.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/size_config.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  ServiceLocator().setupServiceLocators();

  await CacheHelper.initSharedPref();

  Bloc.observer = MyBlocObserver();

  setSystemUIOverlayStyle();

  runApp(const DelibirdApp());
}

class DelibirdApp extends StatelessWidget {
  const DelibirdApp({Key? key}) : super(key: key);

  /*
  
  To Sign Out Use This:

  => await FirebaseAuth.instance.signOut();
  
   */

  // TODO: remember to look at Responsive Class on Zahraa's GitHub
  // TODO: Login with email and password & verify with phone number when the user creating a new account

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Delibird-App',
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
