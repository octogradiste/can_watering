import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering_action.dart';
import 'package:isar/isar.dart';

class WateringActionDao {
  final Isar _isar;

  WateringActionDao(Isar isar) : _isar = isar;

  Future<List<WateringAction>> getAllActionsOf(Plant plant) {
    if (plant.id == null) return Future.value([]);
    return _isar.wateringActions.where().plantIdEqualTo(plant.id!).findAll();
  }

  Future<int> add(WateringAction action) {
    return _isar.writeTxn((isar) async {
      return await isar.wateringActions.put(action);
    });
  }

  Future<int> deleteAllActionsOf(Plant plant) async {
    if (plant.id != null) {
      return _isar.writeTxn((isar) async {
        return await isar.wateringActions
            .where()
            .plantIdEqualTo(plant.id!)
            .deleteAll();
      });
    }
    return 0;
  }
}
