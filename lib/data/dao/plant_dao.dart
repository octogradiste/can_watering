import 'package:can_watering/data/model/plant.dart';
import 'package:isar/isar.dart';

class PlantDao {
  final Isar _isar;

  PlantDao(Isar isar) : _isar = isar;

  Future<List<Plant>> getAll() {
    return _isar.plants.where().findAll();
  }

  Future<int> add(Plant plant) {
    return _isar.writeTxn((isar) async {
      return await isar.plants.put(plant);
    });
  }

  Future<int> update(Plant plant) {
    assert(plant.id != null);
    return add(plant);
  }

  Future<bool> delete(Plant plant) {
    assert(plant.id != null);
    return _isar.writeTxn((isar) async {
      return await isar.plants.delete(plant.id!);
    });
  }
}
