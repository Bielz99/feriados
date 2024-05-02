import 'package:feriados/pages/home/home_cubit.dart';
import 'package:feriados/repository/home_repository.dart';
import 'package:get_it/get_it.dart';

void setupAppBindings() {
  GetIt getIt = GetIt.instance;
  getIt.registerLazySingleton<HomeRepository>(() => HomeRepository());

  // Registrar o HomeCubit corretamente, usando o HomeRepository que você acabou de registrar.
  getIt.registerLazySingleton<HomeCubit>(
      () => HomeCubit(getIt<HomeRepository>()));
}
