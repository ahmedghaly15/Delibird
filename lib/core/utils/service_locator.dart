import 'package:get_it/get_it.dart';
import 'package:nexo_app/features/auth/data/log_in_view_repo_impl.dart';
import 'package:nexo_app/features/auth/domain/log_in_view_repo.dart';

final GetIt serviceLocator = GetIt.instance;

class ServiceLocator {
  void setupServiceLocators() {
    serviceLocator.registerLazySingleton<LoginViewRepo>(
      () => LoginViewRepoImpl(),
    );
  }
}
