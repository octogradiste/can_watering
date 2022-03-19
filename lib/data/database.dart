import 'package:can_watering/data/dao/plant_dao.dart';
import 'package:can_watering/data/dao/watering_action_dao.dart';
import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering_action.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Database._internal();

  static Database? _instance;
  late final Isar _isar;

  late final PlantDao plantDao;
  late final WateringActionDao wateringActionDao;

  Future<Database> get instance async {
    if (_instance == null) {
      final dir = await getApplicationSupportDirectory();

      _isar = await Isar.open(
        schemas: [PlantSchema, WateringActionSchema],
        directory: dir.path,
      );

      plantDao = PlantDao(_isar);
      wateringActionDao = WateringActionDao(_isar);
    }
    return _instance!;
  }

  Future<void> close() async {
    await _isar.close();
    _instance = null;
  }
}
