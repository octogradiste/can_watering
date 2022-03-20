import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:can_watering/data/database.dart';
import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering_action.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

part 'plant_event.dart';
part 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final Database _db;

  PlantBloc(Database database)
      : _db = database,
        super(LoadingState()) {
    on<InitializeEvent>(((event, emit) async {
      emit(LoadingState());
      await _db.initialize();
      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    }));

    on<GoHomeEvent>((event, emit) async {
      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    });

    on<AddEvent>((event, emit) {
      Plant template = Plant(
        name: "Name",
        location: "Location",
        created: DateTime.now(),
        modified: DateTime.now(),
      );
      emit(PlantFormState(template, false));
    });

    on<SaveEvent>((event, emit) async {
      int id = await _db.plantDao.add(event.plant);

      String? path = event.plant.imagePath;
      if (path != null) {
        final dir = await getApplicationSupportDirectory();
        final saveAt = '${dir.path}/$id.png';
        await File(path).copy(saveAt);
        await _db.plantDao.update(Plant(
          id: id,
          name: event.plant.name,
          location: event.plant.location,
          imagePath: saveAt,
          created: event.plant.created,
          modified: event.plant.modified,
        ));
      }

      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    });

    on<DetailEvent>((event, emit) async {
      final actions = await _db.wateringActionDao.getAllActionsOf(event.plant);
      emit(DetailState(event.plant, actions));
    });

    on<DeleteEvent>((event, emit) async {
      await _db.plantDao.delete(event.plant);
      if (event.plant.imagePath != null) {
        final file = File(event.plant.imagePath!);
        await file.delete();
      }
      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    });

    on<ModifyEvent>(((event, emit) {
      emit(PlantFormState(event.plant, true));
    }));

    on<WateringEvent>(((event, emit) async {
      final action = WateringAction(
        amount: event.amount,
        date: DateTime.now(),
        plantId: event.plant.id!,
      );
      await _db.wateringActionDao.add(action);
      final actions = await _db.wateringActionDao.getAllActionsOf(event.plant);
      emit(DetailState(event.plant, actions));
    }));

    add(InitializeEvent());
  }

  Future<String?> pickImage() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.camera);
    return image?.path;
  }

  Future<String?> choseImage() async {
    final picker = ImagePicker();
    final image = await picker.getImage(source: ImageSource.gallery);
    return image?.path;
  }
}
