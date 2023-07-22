import 'package:get_it/get_it.dart';
import 'package:nexo_app/features/auth/data/log_in_view_repo_impl.dart';
import 'package:nexo_app/features/auth/data/sign_up_view_repo_impl.dart';
import 'package:nexo_app/features/auth/domain/log_in_view_repo.dart';
import 'package:nexo_app/features/auth/domain/sign_up_view_repo.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/log_in_view_manager/login_view_cubit.dart';
import 'package:nexo_app/features/auth/presentation/views/managers/sign_up_view_manager/sign_up_view_cubit.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  void setupServiceLocators() {
    serviceLocator.registerLazySingleton<LoginViewRepo>(
      () => LoginViewRepoImpl(),
    );

    serviceLocator.registerLazySingleton<SignUpViewRepo>(
      () => SignUpViewRepoImpl(),
    );

    serviceLocator.registerFactory<LoginViewCubit>(
      () => LoginViewCubit(serviceLocator.get<LoginViewRepo>()),
    );

    serviceLocator.registerFactory<SignUpViewCubit>(
      () => SignUpViewCubit(serviceLocator.get<SignUpViewRepo>()),
    );
  }
}
