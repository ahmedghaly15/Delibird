import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

import 'core/global/app_theme.dart';
import 'core/network/local/cache_helper.dart';
import 'core/network/remote/dio_helper.dart';
import 'core/utils/firebase_options.dart';
import 'core/utils/helper.dart';
import 'core/utils/my_bloc_observer.dart';
import 'core/utils/service_locator.dart';
import 'core/utils/size_config.dart';
import 'features/layout/presentation/views/manager/delibird_app_cubit.dart';
import 'features/splash/presentation/views/splash_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  Bloc.observer = MyBlocObserver();

  ServiceLocator().setupServiceLocators();

  DioHelper.initDio();

  await CacheHelper.initSharedPref();

  setSystemUIOverlayStyle();

  runApp(const DelibirdApp());
}

class DelibirdApp extends StatelessWidget {
  const DelibirdApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
      create: (context) => serviceLocator.get<DelibirdAppCubit>()
        ..getUserData(Helper.uId)
        ..getProducts(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Delibird-App',
        theme: AppTheme.appTheme(),
        home: const SplashView(),
      ),
    );
  }
}

void setSystemUIOverlayStyle() {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(Helper.setTheSystemUIOverlayStyle());
}
