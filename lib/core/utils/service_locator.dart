import 'package:get_it/get_it.dart';
import 'package:nexo_app/features/auth/data/log_in_view_repo_impl.dart';
import 'package:nexo_app/features/auth/data/log_in_with_phone_repo_impl.dart';
import 'package:nexo_app/features/auth/data/sign_up_view_repo_impl.dart';
import 'package:nexo_app/features/auth/domain/log_in_view_repo.dart';
import 'package:nexo_app/features/auth/domain/log_in_with_phone_repo.dart';
import 'package:nexo_app/features/auth/domain/sign_up_view_repo.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_view_manager/login_view_cubit.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_with_phone_manager/login_with_phone_cubit.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/sign_up_view_manager/sign_up_view_cubit.dart';
import 'package:nexo_app/features/get_help/data/get_help_repo_impl.dart';
import 'package:nexo_app/features/get_help/domain/get_help_repo.dart';
import 'package:nexo_app/features/layout/data/layout_repo_impl.dart';
import 'package:nexo_app/features/layout/domain/layout_repo.dart';
import 'package:nexo_app/features/layout/presentation/views/manager/delibird_app_cubit.dart';

import '../../features/get_help/presentation/views/manager/get_help_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  void setupServiceLocators() {
    serviceLocator.registerLazySingleton<LoginViewRepo>(
      () => LoginViewRepoImpl(),
    );

    serviceLocator.registerLazySingleton<SignUpViewRepo>(
      () => SignUpViewRepoImpl(),
    );

    serviceLocator.registerLazySingleton<GetHelpRepo>(
      () => GetHelpRepoImpl(),
    );

    serviceLocator.registerLazySingleton<LoginWithPhoneRepo>(
      () => LoginWithPhoneRepoImpl(),
    );

    serviceLocator.registerFactory<LoginViewCubit>(
      () => LoginViewCubit(serviceLocator.get<LoginViewRepo>()),
    );

    serviceLocator.registerLazySingleton<LayoutRepo>(
      () => LayoutRepoImpl(),
    );

    serviceLocator.registerFactory<SignUpViewCubit>(
      () => SignUpViewCubit(serviceLocator.get<SignUpViewRepo>()),
    );

    serviceLocator.registerFactory<GetHelpCubit>(
      () => GetHelpCubit(serviceLocator.get<GetHelpRepo>()),
    );

    serviceLocator.registerFactory<LoginWithPhoneCubit>(
      () => LoginWithPhoneCubit(serviceLocator.get<LoginWithPhoneRepo>()),
    );

    serviceLocator.registerFactory<DelibirdAppCubit>(
      () => DelibirdAppCubit(serviceLocator.get<LayoutRepo>()),
    );
  }
}
