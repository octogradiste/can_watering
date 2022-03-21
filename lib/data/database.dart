import 'package:can_watering/data/dao/plant_dao.dart';
import 'package:can_watering/data/dao/watering_dao.dart';
import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  bool _isInitialized = false;

  late final Isar _isar;

  late final PlantDao plantDao;
  late final WateringDao wateringDao;

  /// Initializes the database.
  /// Note: You have to initialize it before using the dao's.
  Future<void> initialize() async {
    if (_isInitialized) return;
    final dir = await getApplicationSupportDirectory();

    _isar = await Isar.open(
      schemas: [PlantSchema, WateringSchema],
      directory: dir.path,
    );

    plantDao = PlantDao(_isar);
    wateringDao = WateringDao(_isar);

    _isInitialized = true;
  }

  Future<void> close() async {
    await _isar.close();
  }
}
