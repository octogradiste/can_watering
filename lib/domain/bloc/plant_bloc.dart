import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:can_watering/data/database.dart';
import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering_action.dart';
import 'package:equatable/equatable.dart';

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
      emit(LoadingState());
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
      emit(LoadingState());
      await _db.plantDao.add(event.plant);
      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    });

    on<DetailEvent>((event, emit) {
      emit(DetailState(event.plant));
    });

    on<DeleteEvent>((event, emit) async {
      emit(LoadingState());
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

    on<WateringEvent>(((event, emit) {
      _db.wateringActionDao.add(event.action);
    }));

    add(InitializeEvent());
  }
}
