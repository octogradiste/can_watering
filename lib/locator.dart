import 'package:can_watering/data/database.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void registerServices() {
  locator.registerLazySingleton<Database>(() => Database());
}
