import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:can_watering/data/database.dart';
import 'package:can_watering/data/model/plant.dart';
import 'package:can_watering/data/model/watering.dart';
import 'package:can_watering/presentation/page/detail_page.dart';
import 'package:can_watering/presentation/page/plant_form_page.dart';
import 'package:can_watering/presentation/snack_bar/UndoSnackBar.dart';
import 'package:can_watering/service/screen_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

part 'plant_event.dart';
part 'plant_state.dart';

class PlantBloc extends Bloc<PlantEvent, PlantState> {
  final Database _db;
  final ScreenService _screenService;

  final ImagePicker _imagePicker = ImagePicker();

  PlantBloc(Database database, ScreenService service)
      : _db = database,
        _screenService = service,
        super(LoadingState()) {
    on<InitializeEvent>(((event, emit) async {
      emit(LoadingState());
      await _db.initialize();
      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    }));

    on<HomeEvent>((event, emit) async {
      List<Plant> plants = await _db.plantDao.getAll();
      emit(HomeState(plants));
    });

    on<AddEvent>((event, emit) {
      Plant template = Plant(
        name: "",
        location: "",
        created: DateTime.now(),
        modified: DateTime.now(),
      );
      _screenService.navigateTo(PlantFormPage(
        template: template,
        modify: false,
      ));
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

      add(HomeEvent());
      _screenService.popAll();
    });

    on<DetailEvent>((event, emit) async {
      final waterings = await _db.wateringDao.getAllWateringsOf(event.plant);
      _screenService.navigateTo(DetailPage(
        plant: event.plant,
        waterings: waterings,
      ));
    });

    on<DeleteEvent>((event, emit) async {
      await _db.plantDao.delete(event.plant);
      add(HomeEvent());
      _screenService.pop();
      _screenService.showSnackBar(
        UndoSnackBar(
          message: 'Successfully deleted!',
          onUndo: () async {
            await _db.plantDao.add(event.plant);
            add(HomeEvent());
          },
        ),
        onClosed: (reason) async {
          if (reason != SnackBarClosedReason.action) {
            if (event.plant.imagePath != null) {
              final file = File(event.plant.imagePath!);
              await file.delete();
            }
            await _db.wateringDao.deleteAllWateringsOf(event.plant);
          }
        },
      );
    });

    on<ModifyEvent>(((event, emit) {
      _screenService.navigateTo(PlantFormPage(
        template: event.plant,
        modify: true,
      ));
    }));

    on<WateringEvent>(((event, emit) async {
      final watering = Watering(
        amount: event.amount,
        date: DateTime.now(),
        plantId: event.plant.id!,
      );
      await _db.wateringDao.add(watering);
      final waterings = await _db.wateringDao.getAllWateringsOf(event.plant);
      emit(DetailUpdateState(event.plant, waterings));
    }));

    add(InitializeEvent());
  }

  Future<String?> takePicture() async {
    final image = await _imagePicker.getImage(source: ImageSource.camera);
    return image?.path;
  }

  Future<String?> choseImage() async {
    final image = await _imagePicker.getImage(source: ImageSource.gallery);
    return image?.path;
  }
}
