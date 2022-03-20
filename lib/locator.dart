import 'package:can_watering/data/database.dart';
import 'package:can_watering/service/screen_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void registerServices() {
  locator.registerLazySingleton(() => Database());
  locator.registerLazySingleton(() => ScreenService());
}
