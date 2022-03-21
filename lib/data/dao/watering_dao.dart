import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering.dart';
import 'package:isar/isar.dart';

class WateringDao {
  final Isar _isar;

  WateringDao(Isar isar) : _isar = isar;

  Future<List<Watering>> getAllOf(Plant plant) {
    if (plant.id == null) return Future.value([]);
    return _isar.waterings.where().plantIdEqualTo(plant.id!).findAll();
  }

  Future<int> add(Watering action) {
    return _isar.writeTxn((isar) async {
      return await isar.waterings.put(action);
    });
  }

  Future<int> deleteAllOf(Plant plant) async {
    if (plant.id != null) {
      return _isar.writeTxn((isar) async {
        return await isar.waterings
            .where()
            .plantIdEqualTo(plant.id!)
            .deleteAll();
      });
    }
    return 0;
  }

  Future<bool> delete(Watering watering) async {
    if (watering.id == null) return false;
    return _isar.writeTxn((isar) async {
      return await _isar.waterings.delete(watering.id!);
    });
  }
}
