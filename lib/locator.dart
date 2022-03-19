import 'package:can_watering/data/database.dart';
import 'package:get_it/get_it.dart';

void registerServiceLocator() {
  GetIt.I.registerLazySingleton<Database>(() => Database());
}
